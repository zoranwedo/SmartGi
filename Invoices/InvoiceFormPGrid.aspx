<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InvoiceFormPGrid.aspx.vb" Inherits="Invoices_InvoiceFormPGrid"
     ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dumySuppCancel').click();
        }
        function okay() {
            window.parent.document.getElementById('dumySuppOK').click();
        }

        function CheckRate(objRef) {
            var cb = objRef.nextElementSibling.childNodes[0]
            cb.checked = !cb.checked;
            if (cb.checked) {
                objRef.parentElement.className = "CheckedRow"
            }
            else
            {
                objRef.parentElement.className = ""
            }
        }

        function CheckMe(objRef) {
            if (objRef.checked) {
                objRef.parentElement.parentElement.className = "CheckedRow"
            }
            else {
                objRef.parentElement.parentElement.className = ""
            }
        }
        
    </script>
</head>
<body>
    <form id="form_P" runat="server">
    <div class="Green" style="background-color: Transparent; vertical-align: bottom;" >
        <div class="GridLabelBG" style="width: 1410px; overflow: hidden;" >
            <div style="float: left; position: absolute; left: 10px; vertical-align: middle; padding-right: 3px; display: inline;" >
                <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                    ImageUrl="~/Images/cancel_big.gif" OnClientClick="cancel();" />
            </div>
            <asp:Label ID="lblTitle" runat="server" Text="Avalilable Supplements" CssClass="GridLabel" Height="26px" />
            <div style="float: right; position: absolute; right: 25px; vertical-align: middle; padding-left: 2px; padding-right: 6px; display: inline; background-color: White;" >
                <asp:Button ID="btnApply" runat="server" CausesValidation="False" CssClass="ButtonRed"
                    Text="Apply Selected Supplements" Height="24px" Visible='<%# IsActive %>' />
            </div>
        </div> 
        <asp:Panel ID="pnlRates" runat="server" style="table-layout: fixed; width: 1440px; max-width: 1440px; max-height: 480px;" ScrollBars="Vertical">
            <div style="table-layout: fixed; overflow: visible;" >
                <table id="Rates" cellpadding="0" cellspacing="0" style="background-color: White;" >
                    <tr>
                        <td class="GridBorder" style="vertical-align: top; border-bottom: none;">
                            <asp:ObjectDataSource ID="dsSuppRate" runat="server" 
                                TypeName="dsInvoiceFormTableAdapters.Rate_SuppSelectByStayTableAdapter" 
                                SelectMethod="GetData" >
                                <SelectParameters>
                                    <asp:Parameter Name="HRate" Type="Boolean" />
                                    <asp:QueryStringParameter Name="DetailID" QueryStringField="DetailID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:GridView ID="gvSuppRates" runat="server" AutoGenerateColumns="False" DataSourceID="dsSuppRate"
                                DataKeyNames="RateID" SelectedIndex="0" BorderStyle="None">
                                <RowStyle CssClass="GridRow1B" Wrap="False" />
                                <SelectedRowStyle CssClass="SelectRow1TB" Wrap="False" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibSelect" runat="server" CommandName="Select" ImageUrl="~/Images/select_.gif" ToolTip="Select for details" />
                                            <asp:LinkButton ID="lnkRateID" runat="server" CommandName="Select" Text='<%# Eval("RateID") %>' Width="65" ToolTip="Select for details" />
                                        </ItemTemplate>
                                        <ItemStyle Width="90px"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>
                                            <%--
                                            <asp:LinkButton ID="lbRate" runat="server" style="padding: 0px 3px 0px 3px;" Width="80px" 
                                                Text='<%# Eval("RateCodeId") %>' 
                                                Enabled='<%# IsActive %>' 
                                                CommandName='<%# Eval("RateCodeId") %>' 
                                                CommandArgument='<%# Eval("RateID") %>'
                                                OnCommand="SuppInsert_Command" 
                                                ToolTip="Accept rate" />
                                            <asp:ImageButton ID="ibRate" runat="server" ImageUrl="~/Images/accept.png" CssClass="InvButton" 
                                                Visible='<%# IsActive %>' 
                                                CommandName='<%# Eval("RateCodeId") %>' 
                                                CommandArgument='<%# Eval("RateID") %>'
                                                OnCommand="SuppInsert_Command" 
                                                ToolTip="Accept rate" />
                                            --%>
                                            <asp:LinkButton ID="lbRate" runat="server" style="padding: 0px 3px 0px 3px;" Width="80px" 
                                                Text='<%# Eval("RateCodeId") %>' 
                                                Visible='<%# IsActive %>' 
                                                OnClientClick="CheckRate(this); return false;"
                                                ToolTip="Accept rate" />
                                            <asp:CheckBox ID="cbRate" runat="server" style="padding: 0px 3px 0px 3px;" 
                                                Visible='<%# IsActive %>' />
                                                <%--Enabled="False" />--%>
                                            <asp:HiddenField ID="hfRateID" runat="server" Value='<%# Eval("RateID") %>' />
                                            <asp:HiddenField ID="hfRateCodeID" runat="server" Value='<%# Eval("RateCodeId") %>' />
                                            <asp:LinkButton ID="LinkButton1" runat="server" style="padding: 0px 3px 0px 3px;" Width="80px" 
                                                Text='<%# Eval("RateCodeId") %>' 
                                                Visible='<%# Not IsActive %>' 
                                                Enabled="false" />
                                        </ItemTemplate>
                                        <ItemStyle Width="115px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Supplement">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkSuppl" runat="server" CommandName="Select" Text='<%# Eval("SupTitle") %>' 
                                                style="padding: 0px 3px 0px 3px; overflow: hidden;" Width="250px" ToolTip="Select for details" />
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" />
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
                                                Text='<%# Iif(Eval("PerPax"),"PP","PR") & "/" & Iif(Eval("PerDay"),"PD","PS") %>'
                                                ToolTip='<%# Iif(Eval("PerPax"),"PerPax","PerRoom") & "/" & Iif(Eval("PerDay"),"PerDay","PerStay") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="45px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Adult">
                                        <ItemTemplate>
                                            <asp:Label ID="Label104" runat="server" 
                                                Text='<%# Eval("RateAdult","{0:N}") & Iif(Eval("IsPercent"),"%"," USD") %>'
                                                Visible='<%# Not (Eval("RateAdult") is DBNull.Value) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Extra">
                                        <ItemTemplate>
                                            <asp:Label ID="Label105" runat="server" 
                                                Text='<%# Eval("RateExtra","{0:N}") & Iif(Eval("IsPercent"),"%"," USD") %>'
                                                Visible='<%# Not (Eval("RateExtra") is DBNull.Value) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Child">
                                        <ItemTemplate>
                                            <asp:Label ID="Label106" runat="server" 
                                                Text='<%# Eval("RateChild","{0:N}") & Iif(Eval("IsPercent"),"%"," USD") %>'
                                                Visible='<%# Not (Eval("RateChild") is DBNull.Value) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" >
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Style="border: none; background: transparent;"
                                                CssClass="TextBox" Font-Size="X-Small" ReadOnly="True" 
                                                Text='<%# Eval("SupDescription") %>'
                                                ToolTip='<%# Eval("SupDescription") %>'
                                                Width="300px" />
                                        </ItemTemplate>
                                        <ItemStyle Width="310px" Wrap="False" />
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
                                TypeName="dsInvoiceFormTableAdapters.Rate_SuppSelectByStayInfoTableAdapter" 
                                SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvSuppRates" Name="RateID" PropertyName="SelectedValue" Type="Int64" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:FormView ID="fvInfo" runat="server" DataSourceID="dsInfo" Width="100%">
                                <RowStyle CssClass="SelectRowClear50" />
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td style="width: 100px; padding: 2px;">
                                                <u><b>Supplement:</b></u>
                                            </td>
                                            <td style="width: 400px; padding: 2px;">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' />
                                                &nbsp;
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SupTitle") %>' />
                                            </td>
                                            <td colspan="5" style="padding: 2px;">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" AutoPostBack="false" Text="Mandatory" Checked='<%# Eval("IsMandatory") %>' TextAlign="Left" />
                                                <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" AutoPostBack="false" Text="Combinable" Checked='<%# Eval("Combinable") %>' TextAlign="Left" />
                                                <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false" AutoPostBack="false" Text="Restrict on EBB" Checked='<%# Eval("RestrictEBB") %>' TextAlign="Left" />
                                                <asp:CheckBox ID="CheckBox4" runat="server" Enabled="false" AutoPostBack="false" Text="All Week Days" Checked="true" TextAlign="Left" Visible='<%# Eval("WeekDays")="YYYYYYY" %>' />
                                                &nbsp;
                                                <asp:Label ID="Label3" runat="server" Text="Week Days:" Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox12" runat="server" Enabled="false" AutoPostBack="false" Text="Su" Checked='<%# Eval("WeekDays").Chars(0)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox13" runat="server" Enabled="false" AutoPostBack="false" Text="Mo" Checked='<%# Eval("WeekDays").Chars(1)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox14" runat="server" Enabled="false" AutoPostBack="false" Text="Tu" Checked='<%# Eval("WeekDays").Chars(2)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox15" runat="server" Enabled="false" AutoPostBack="false" Text="We" Checked='<%# Eval("WeekDays").Chars(3)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox16" runat="server" Enabled="false" AutoPostBack="false" Text="Th" Checked='<%# Eval("WeekDays").Chars(4)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox17" runat="server" Enabled="false" AutoPostBack="false" Text="Fr" Checked='<%# Eval("WeekDays").Chars(5)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                <asp:CheckBox ID="CheckBox18" runat="server" Enabled="false" AutoPostBack="false" Text="Sa" Checked='<%# Eval("WeekDays").Chars(6)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; padding: 2px;">
                                                <u><b>On Contract:</b></u>
                                            </td>
                                            <td style="width: 400px; padding: 2px;">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' />
                                                &nbsp;
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                            </td>
                                            <td style="width: 100px; padding: 2px;">
                                                <u><b>Children Policy:</b></u>
                                            </td>
                                            <td style="width: 150px; padding: 2px;">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & "):<br />from " & Eval("Chld1From") & " to less than " & Eval("Chld1Max") %>'
                                                    Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                <asp:Label ID="Label12" runat="server" Text="Adult Only" Visible='<%# Eval("ChldCategories") = 0 %>' />
                                            </td>
                                            <td style="width: 150px;">
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "):<br />from " & Eval("Chld2From") & " to less than " & Eval("Chld2Max") %>'
                                                    Visible='<%# Eval("ChldCategories") > 1 %>' />
                                            </td>
                                            <td style="width: 150px;">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "):<br />from " & Eval("Chld3From") & " to less than " & Eval("Chld3Max") %>'
                                                    Visible='<%# Eval("ChldCategories") > 2 %>' />
                                            </td>
                                            <td style="width: 150px;">
                                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "):<br />from " & Eval("Chld4From") & " to less than " & Eval("Chld4Max") %>'
                                                    Visible='<%# Eval("ChldCategories") > 3 %>' />
                                            </td>
                                        </tr>
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
