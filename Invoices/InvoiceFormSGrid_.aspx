<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InvoiceFormSGrid.aspx.vb" Inherits="Invoices_InvoiceFormSGrid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dumyStayCancel').click();
        }
        function okay() {
            window.parent.document.getElementById('dumyStayOK').click();
        }
    </script>
</head>
<body>
    <form id="form_S" runat="server">
    <div class="Green" style="background-color: Transparent; vertical-align: bottom;" >
        <div class="GridLabelBG" style="width: 1270px; overflow: hidden;" >
            <div style="float: left; position: absolute; left: 10px; vertical-align: middle; padding-right: 3px; display: inline;" >
                <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                    ImageUrl="~/Images/cancel_big.gif" OnClientClick="cancel();" />
            </div>
            <asp:Label ID="lblTitle" runat="server" Text="Avalilable Rates" CssClass="GridLabel" Height="26px" />
            <asp:CheckBox ID="cbAllPax" runat="server" Checked="False" Text="Show all pax rates" AutoPostBack="True" style="margin-left: 20px; vertical-align: top; color: White;" />
        </div> 
        <asp:Panel ID="pnlRates" runat="server" style="table-layout: fixed; width: 1300px; max-width: 1300px; max-height: 500px;" ScrollBars="Vertical">
            <div style="table-layout: fixed; overflow: visible;" >
                <table id="Rates" cellpadding="0" cellspacing="0" style="background-color: White;" >
                    <tr>
                        <td class="GridBorder" style="vertical-align: top; border-bottom: none;">
                            <%--<asp:ObjectDataSource ID="dsStayRate" runat="server" 
                                TypeName="dsInvoiceFormTableAdapters.Rate_SelectByBillTableAdapter" 
                                SelectMethod="GetData" >
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BillingId" QueryStringField="BillingID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:GridView ID="gvStayRates" runat="server" AutoGenerateColumns="False" DataSourceID="dsStayRate"--%>
                            <asp:GridView ID="gvStayRates" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="RateID" SelectedIndex="0" BorderStyle="None">
                                <RowStyle CssClass="GridRow1B" Wrap="False" />
                                <SelectedRowStyle CssClass="SelectRow1TB" Wrap="False" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" />
                                <Columns>
                                    <%--Column 0--%>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibSelect" runat="server" CommandName="Select" ImageUrl="~/Images/select_.gif" ToolTip="Select for details" />
                                            <asp:LinkButton ID="lnkRateID" runat="server" CommandName="Select" Text='<%# Eval("RateID") %>' Width="65" ToolTip="Select for details" />
                                        </ItemTemplate>
                                        <ItemStyle Width="90px"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbRate" runat="server" style="padding: 0px 3px 0px 3px;" Width="80px" 
                                                Text='<%# Eval("RateCodeId") %>' 
                                                CommandName='<%# Eval("RateCodeId") %>' 
                                                CommandArgument='<%# Eval("RateID") %>'
                                                OnCommand="RateUpdate_Command" 
                                                ToolTip="Accept rate" />
                                            <asp:ImageButton ID="ibRate" runat="server" ImageUrl="~/Images/accept.png" CssClass="InvButton" 
                                                CommandName='<%# Eval("RateCodeId") %>' 
                                                CommandArgument='<%# Eval("RateID") %>'
                                                OnCommand="RateUpdate_Command" 
                                                ToolTip="Accept rate" />
                                        </ItemTemplate>
                                        <ItemStyle Width="115px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bk.Code">
                                        <ItemTemplate>
                                            <asp:Label ID="Label100" runat="server" Text='<%# Eval("BookingCode") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bk.Window">
                                        <ItemTemplate>
                                            <asp:Label ID="Label101" runat="server" 
                                                Text='<%# If(Eval("BkStart") is DBNull.Value AND Eval("BkFinish") is DBNull.Value,"", Iif(Eval("BkStart") is DBNull.Value,"*",Eval("BkStart", "{0:d}")) & " - " & Iif(Eval("BkFinish") is DBNull.Value,"*",Eval("BkFinish", "{0:d}"))) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="140px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tr.Window">
                                        <ItemTemplate>
                                            <asp:Label ID="Label102" runat="server" Text='<%# Eval("Start", "{0:d}") & " - " & Eval("Finish", "{0:d}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="140px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opt.">
                                        <ItemTemplate>
                                            <asp:Label ID="Label103" runat="server" 
                                                Text='<%# Iif(Eval("PerPax"),"PP","PR") & "/" & Iif(Eval("RateOption")=1,"PS",Iif(Eval("RateOption")=0,"PA","Inc")) %>'
                                                ToolTip='<%# Iif(Eval("PerPax"),"PerPax","PerRoom") & "/" & Iif(Eval("RateOption")=1,"PerStay",Iif(Eval("RateOption")=0,"PerArrival","Inclusive")) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="35px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RatePax1" DataFormatString="{0:N2}" HeaderText="Sgl">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax2" DataFormatString="{0:N2}" HeaderText="Dbl">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax3" DataFormatString="{0:N2}" HeaderText="Trpl">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax4" DataFormatString="{0:N2}" HeaderText="Qud">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <%--Column 10--%>
                                    <asp:TemplateField HeaderText="..." Visible="True">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRatePax" runat="server" 
                                                Text="..."
                                                ToolTip='<%# "Qun: " & Eval("RatePax5") & vbNewLine & "Sext: " & Eval("RatePax6") & vbNewLine & "Sept: " & Eval("RatePax7") & vbNewLine & "Oct: " & Eval("RatePax8") & vbNewLine & "Non: " & Eval("RatePax9") & vbNewLine & "Dec: " & Eval("RatePax10") & vbNewLine & "Ext: " & Eval("RateExtra") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="40px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RatePax5" DataFormatString="{0:N2}" HeaderText="Qun" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax6" DataFormatString="{0:N2}" HeaderText="Sext" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax7" DataFormatString="{0:N2}" HeaderText="Sept" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax8" DataFormatString="{0:N2}" HeaderText="Oct" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax9" DataFormatString="{0:N2}" HeaderText="Non" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RatePax10" DataFormatString="{0:N2}" HeaderText="Dec" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateExtra" DataFormatString="{0:N2}" HeaderText="Ext" Visible="False">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <%--Column 18--%>
                                    <asp:BoundField DataField="RateChld1" DataFormatString="{0:N2}" HeaderText="*">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateChld2" DataFormatString="{0:N2}" HeaderText="*">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateChld3" DataFormatString="{0:N2}" HeaderText="*">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateChld4" DataFormatString="{0:N2}" HeaderText="*">
                                        <ItemStyle Width="40px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Description" >
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Style="border: none; background: transparent;"
                                                CssClass="TextBox" Font-Size="X-Small" ReadOnly="True" 
                                                Text='<%# Iif(Eval("SpoDescription") is DBNull.Value,Eval("CtrDecription"),Eval("SpoDescription")) %>'
                                                ToolTip='<%# "Rate comment:  " & Eval("DESCRIPTION") & vbNewLine & "SPO comment:  " & Eval("SpoDescription") & vbNewLine & "SPO terms:  " & Eval("SpoTerms") & vbNewLine & "Rate period comment:  " & Eval("CtrPeriodNote") & vbNewLine & "Contract comment:  " & Eval("CtrDecription") %>'
                                                Width="250px" />
                                        </ItemTemplate>
                                        <ItemStyle Width="260px" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="width: 1000px; text-align: center; font-weight: bold; font-style: italic;">
                                    - NO AVAILABLE RATES -
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="vertical-align: top; border-top: none;">
                            <asp:Label ID="lblError" runat="server" Text="Label" Style="text-align: center; font-weight: bold; color: Red; width: 500px;" Visible="False" />
                            <asp:ObjectDataSource ID="dsInfo" runat="server" 
                                TypeName="dsInvoiceFormTableAdapters.Rate_SelectByBillInfoTableAdapter" 
                                SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvStayRates" Name="RateID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:FormView ID="fvInfo" runat="server" DataSourceID="dsInfo" Width="100%">
                                <RowStyle CssClass="SelectRowClear50" />
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td style="vertical-align: top; padding: 2px;">
                                                <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                    <asp:Panel ID="pnlSPO" runat="server" Visible='<%# Not (Eval("SpecialID") Is DBNull.Value) %>'>
                                                        <tr>
                                                            <td style="width: 120px;">
                                                                <asp:Label ID="SpoLabel" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")=6,"<u><b>Free-rate special:</b></u>","<u><b>Special:</b></u>") %>' />
                                                            </td>
                                                            <td style="width: 400px;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' />
                                                                &nbsp;
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SpoTitle") %>' />
                                                                &nbsp;
                                                                <i>
                                                                <asp:Label ID="Label12" runat="server" Text='<%# "&nbsp;-&nbsp;" & Eval("SpoDiscount1") %>' Visible='<%# Eval("SpoDiscount1ID")<>6 %>' />
                                                                <asp:Label ID="Label13" runat="server" Text='<%# Iif(Eval("SpoOn1") Is DBNull.Value,""," on " & Eval("SpoOn1")) %>' />
                                                                <asp:Label ID="Label14" runat="server" Text='<%# Iif(Eval("SpoDiscount2ID")<>-1,"AND " & Eval("SpoDiscount2"),"") %>' />
                                                                <asp:Label ID="Label15" runat="server" Text='<%# Iif(Eval("SpoOn2") Is DBNull.Value,""," on " & Eval("SpoOn2")) %>' />
                                                                </i>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlCTR" runat="server" Visible='<%# Eval("SpoDiscount1ID")<>6 %>'>
                                                        <tr>
                                                            <td style="width: 120px;">
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")>-1,"<u><b>On Contract:</b></u>","<u><b>Contract:</b></u>") %>' />
                                                            </td>
                                                            <td style="width: 400px;">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' />
                                                                &nbsp;
                                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                </table> 
                                            </td>
                                            <td style="vertical-align: top; text-align: center; padding: 2px;">
                                                <u><b>Children Policy:</b></u>&nbsp;
                                            </td>
                                            <td style="vertical-align: top; text-align: center; padding: 2px;">
                                                <asp:Panel ID="pnlCHILD" runat="server" Visible='<%# Eval("ChldCategories")>0 %>'>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                        <tr>
                                                            <td style="width: 150px;">
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & "):<br />from " & Eval("Chld1From") & " to less than " & Eval("Chld1Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                            </td>
                                                            <td style="width: 150px;">
                                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "):<br />from " & Eval("Chld2From") & " to less than " & Eval("Chld2Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 1 %>' />
                                                            </td>
                                                            <td style="width: 150px;">
                                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "):<br />from " & Eval("Chld3From") & " to less than " & Eval("Chld3Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 2 %>' />
                                                            </td>
                                                            <td style="width: 150px;">
                                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "):<br />from " & Eval("Chld4From") & " to less than " & Eval("Chld4Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 3 %>' />
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </asp:Panel>
                                                <asp:Panel ID="pnlADULT" runat="server" Visible='<%# Eval("ChldCategories")=0 %>'>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                Adult Only
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <%----%>
										<asp:Panel ID="Panel1" runat="server" 
                                            Visible='<%# Not Eval("ctrComment") Is DBNull.Value OR Not Eval("spoComment") Is DBNull.Value OR Not Eval("suppComment") Is DBNull.Value %>' >
                                            <tr>
                                                <td colspan="3" >
                                                    <div style="overflow: auto; max-height: 50px; border-top: dotted 1px;">
                                                    <b>SIHOT Comments:&nbsp;</b>
                                                    <i>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ctrComment") & "<br />" %>' Visible='<%# Not Eval("ctrComment") Is DBNull.Value %>' />
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("spoComment") & "<br />" %>' Visible='<%# Not Eval("spoComment") Is DBNull.Value %>' />
                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("suppComment") %>' Visible='<%# Not Eval("suppComment") Is DBNull.Value %>' />
                                                    </i>
                                                    </div>
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                    </table> 
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table> 
            </div>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
