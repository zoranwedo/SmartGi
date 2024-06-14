<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master"
    AutoEventWireup="false" CodeFile="AccDocApplication.aspx.vb" Inherits="Accounting_AccDocApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Applications
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:HiddenField ID="hfCanEdit" runat="server" />
    <asp:HiddenField ID="hfCanApply" runat="server" />
    <asp:HiddenField ID="hfUser" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" colspan="2">
                    <asp:Label ID="lbDetails" runat="server" Text="Application details" SkinID="skGridLabel" />
                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" ForeColor="White" Height="29px"
                        AutoPostBack="True" Visible="False" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" colspan="2">
                    <asp:UpdatePanel runat="server" ID="pnlPop">
                        <ContentTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 102px;">
                                        <b>Transaction</b> ID:
                                    </td>
                                    <td class="GridRow2B" style="width: 306px;">
                                        <asp:Label ID="lblTransID" runat="server" />
                                    </td>
                                    <td class="GridRow2B" style="width: 222px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding-left: 20px;">
                                        Date:
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtTransDate" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="txtTransDate_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="txtTransDate" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtTransDate"
                                            Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator1" />
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding-left: 20px;">
                                        Comment:
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtTransComment" runat="server" CssClass="TextBox" />
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        &nbsp;
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:CheckBox ID="cbShowCancel" runat="server" AutoPostBack="True" Text="Show Canceled" />
                                    </td>
                                    <td class="GridRowClear">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <br />
                                        <asp:GridView ID="gvApplications" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccTranAppl"
                                            SkinID="skGridView" ShowFooter="True">
                                            <Columns>
                                                <asp:BoundField DataField="DocDate" DataFormatString="{0:d}" HeaderText="DocDate">
                                                    <ItemStyle Width="100px" VerticalAlign="Top" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Document">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DocCode") %>' />
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DocNumber") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100px" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DocAccount" HeaderText="Account" FooterText="Balance:">
                                                    <FooterStyle Font-Bold="True" Font-Italic="True" HorizontalAlign="Center" />
                                                    <ItemStyle Width="100px" VerticalAlign="Top" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Amount" DataFormatString="{0:N2}" HeaderText="Amount">
                                                    <ItemStyle Width="75px" VerticalAlign="Top" HorizontalAlign="Right" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                            ImageUrl="~/Images/accept_inline.gif" ToolTip="Update" />
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                            ImageUrl="~/Images/decline_inline.gif" ToolTip="Cancel" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbComment" runat="server" Text='<%# Eval("AppComment") %>' style="margin-left: 5px;" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="220px" VerticalAlign="Top" Wrap="true" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_inline.gif"
                                                            ToolTip="Delete" CommandArgument='<%# Eval("DocID") %>' 
                                                            OnClientClick="return confirm('Are you sure you want to deapply this document?')" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25px" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="GridRow2T" style="height: 40px; vertical-align: middle;">
                                        <asp:Button ID="lbMulti" runat="server" style="float: left;" Text="Multiple document application" SkinID="skBtnBase" BorderColor="SkyBlue" BorderStyle="Solid" BorderWidth="5px" />
                                        <asp:Button ID="lbSingle" runat="server" style="float: right;" Text="Single document application" SkinID="skBtnBase" BorderColor="White" BorderStyle="Solid" BorderWidth="5px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1T" colspan="3">
                                        <asp:Panel ID="pnlFilter" runat="server" >
                                            <table>
                                                <tr>
                                                    <td style="width: 80px; text-align: right;">
                                                        Doc.No.From
                                                    </td>
                                                    <td style="width: 100px;">
                                                        <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" Width="90px" />
                                                        <asp:TextBoxWatermarkExtender ID="wmfltInvFrom" runat="server" TargetControlID="fltInvFrom"
                                                            WatermarkCssClass="WaterMark" WatermarkText="Acc.Doc.No. from" />
                                                        <asp:CompareValidator ID="valfltInvFrom" runat="server" ControlToValidate="fltInvFrom"
                                                            Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                        <asp:ValidatorCalloutExtender ID="valfltInvFrom_ValidatorCalloutExtender" runat="server"
                                                            TargetControlID="valfltInvFrom" />
                                                    </td>
                                                    <td style="width: 80px; text-align: right;">
                                                        Doc.No.To
                                                    </td>
                                                    <td style="width: 100px;">
                                                        <asp:TextBox ID="fltInvTo" runat="server" CssClass="TextBox" Width="90%" />
                                                        <asp:TextBoxWatermarkExtender ID="wmfltInvTo" runat="server" TargetControlID="fltInvTo" 
                                                            WatermarkCssClass="WaterMark" WatermarkText="Acc.Doc.No. to" />
                                                        <asp:CompareValidator ID="valfltInvTo" runat="server" ControlToValidate="fltInvTo"
                                                            Display="None" ErrorMessage="Not a valid numberd!" Operator="DataTypeCheck" Type="Integer" />
                                                        <asp:ValidatorCalloutExtender ID="valfltInvTo_ValidatorCalloutExtender" runat="server"
                                                            TargetControlID="valfltInvTo" />
                                                    </td>
                                                    <td style="width: 80px; text-align: right;">
                                                        <asp:Button ID="btFiletrDocs" runat="server" SkinID="skBtnFilter" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" BackColor="White"
                                            DataKeyNames="DocumentID,DocCode,DocNumber,DocOrd,Balance" CssClass="GridRow1T"
                                            DataSourceID="dsAccDocToApply" GridLines="None" OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged"
                                            ShowFooter="True" AllowPaging="True" PageSize="25" Visible="False" EnableSortingAndPagingCallbacks="True">
                                            <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                            <SelectedRowStyle CssClass="SelectRowClear" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbSel" runat="server" Checked="false" Enabled='<%# Eval("DocApproved") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select all">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtDocID" runat="server" Text='<%# Eval("DocumentID") %>'/>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:LinkButton ID="hdSelectAll" runat="server" Text="Select All" OnClick="lbSelectAll_Click" />
                                                        &nbsp;
                                                    </HeaderTemplate>
                                                    <ItemStyle Width="60px" Wrap="False" />
                                                    <HeaderStyle HorizontalAlign="Right" Font-Bold="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField  HeaderText="Deelect all">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="lblDoc" runat="server" NavigateUrl='<%# "AccDocDetail.aspx?DocumentID=" & Eval("DocumentID") %>'>
                                                        <asp:Label ID="lblDoc1" runat="server" Text='<%# Eval("DocCode") %>'/>
                                                        <asp:Label ID="lblDoc2" runat="server" Text='<%# Eval("DocNumber") %>'/>
                                                        </asp:HyperLink>
                                                        <asp:HiddenField ID="hfDoc" runat="server" Value='<%# Eval("DocCode") & " " & Eval("DocNumber") %>' />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        &nbsp;
                                                        <asp:LinkButton ID="hdDeselectAll" runat="server" Text="DeselectAll" OnClick="lbDeselectAll_Click" />
                                                    </HeaderTemplate>
                                                    <ItemStyle Width="100px" />
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="false" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Balance" >
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgNotApproved" runat="server" ImageUrl="~/Images/Warning.png" style="float: left;" 
                                                            Visible='<%# Not Eval("DocApproved") %>' ToolTip="Document is not approved" />
                                                        <asp:Label ID="txtAmountFull" runat="server" style="margin-right: 5px;"
                                                            Text='<%# Bind("Balance", "{0:N2}") %>' ToolTip='<%# Bind("Balance", "{0:N2}") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="80px"/>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Apply amount">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" Enabled='<%# Eval("DocApproved") %>' style="text-align: right;" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="80px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Comment">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtComment" runat="server" Visible='<%# Eval("DocApproved") %>' CssClass="TextBox" />
                                                        <asp:Label ID="lblNotApproved" runat="server" Text="Document is not approved" Visible='<%# Not Eval("DocApproved") %>' 
                                                            style="padding-left: 10px; font-style: italic; color: GrayText" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="lbApplySel" runat="server" SkinID="skBtnBase" Text="Apply Selected" 
                                                            OnClientClick="return confirm('Are you sure you want to apply all this documents?')" 
                                                            OnClick="lbApplySel_Click" />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="280px" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle HorizontalAlign="Center" CssClass="GridRow1T" VerticalAlign="Bottom" Height="25px" />
                                            <HeaderStyle CssClass="GridRow1B" />
                                            <EmptyDataTemplate>
                                                No documents to apply!
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:FormView ID="fvNew" runat="server" DataSourceID="dsAccTranAppl" DefaultMode="Insert" Visible="False">
                                            <InsertItemTemplate>
                                                <table cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td style="width: 20px;">&nbsp;</td>
                                                        <td style="width: 160px;" colspan="2">
                                                            <b>Apply Doc</b>
                                                        </td>
                                                        <td style="width: 80px;">
                                                            <b>Amount</b>
                                                        </td>
                                                        <td style="width: 310px;">
                                                            <b>Comment</b>
                                                        </td>
                                                        <td style="width: 50px;">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="GridRow1T" style="width: 20px;">&nbsp;</td>
                                                        <td class="GridRow1T" style="width: 60px;">
                                                            <asp:TextBox ID="txtDocID" runat="server" CssClass="TextBox" ReadOnly="True" />
                                                            <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="gvDocToApply"
                                                                Position="Center" TargetControlID="txtDocID">
                                                            </asp:PopupControlExtender>
                                                            <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" CssClass="GridBorder" 
                                                                BackColor="White" ShowFooter="False" ShowHeader="false" GridLines="None"
                                                                DataKeyNames="DocumentID,DocCode,DocNumber,DocOrd,Balance,DocApproved"
                                                                DataSourceID="dsAccDocToApply" OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged">
                                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                                <Columns>
                                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False" ShowSelectButton="True">
                                                                        <ItemStyle Width="20px" />
                                                                    </asp:CommandField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="imgNotApproved" runat="server" ImageUrl="~/Images/Warning.png" 
                                                                                Visible='<%# Not Eval("DocApproved") %>' ToolTip="Document is not approved" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10px" />
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="DocumentID" HeaderText="" ReadOnly="True" SortExpression="DocumentID" DataFormatString="({0})">
                                                                        <ItemStyle Width="60px" Wrap="false" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="DocCode" SortExpression="DocCode">
                                                                        <ItemStyle Wrap="false" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="DocNumber" HeaderText="" SortExpression="DocNumber">
                                                                        <ItemStyle Wrap="false" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="DocOrd" SortExpression="DocOrd" Visible="false">
                                                                        <ItemStyle Width="50px" Wrap="false" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Balance" SortExpression="Balance" DataFormatString="{0:N2}">
                                                                        <ItemStyle Width="80px" Wrap="false" HorizontalAlign="Right" />
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="HBalance" SortExpression="HBalance" DataFormatString="{0:N2}" Visible="false">
                                                                        <ItemStyle Width="80px" Wrap="false" HorizontalAlign="Right" ForeColor="Gray" Font-Italic="true" />
                                                                        <HeaderStyle HorizontalAlign="Right" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>&nbsp;</ItemTemplate>
                                                                        <ItemStyle Width="10px" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    No documents to apply!
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px;">
                                                            <asp:TextBox ID="txtDoc" runat="server" CssClass="TextBox" Enabled="False" ReadOnly="True" />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 80px;">
                                                            <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" style="text-align:right;" />
                                                            <asp:CompareValidator ID="valtxtAmount" runat="server" ControlToValidate="txtAmount"
                                                                Display="None" ErrorMessage="Not a valid amount!" Operator="DataTypeCheck" Type="Currency" />
                                                            <asp:ValidatorCalloutExtender ID="valtxtAmount_ValidatorCalloutExtender" runat="server"
                                                                TargetControlID="valtxtAmount" />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 310px;">
                                                            <asp:TextBox ID="txtComment" runat="server" CssClass="TextBox" />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 50px; padding: 0px 5px 0px 5px;">
                                                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Insert" ImageUrl="~/Images/accept_inline.gif"
                                                                CausesValidation="False" />
                                                            <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif"
                                                                CausesValidation="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1T" colspan="3" style="padding-top: 5px; height: 30px; text-align: right;">
                                        <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel Transaction"
                                            OnClientClick="return confirm('Are you sure you want to cancel this transaction?')"
                                            Enabled="False" />&nbsp;
                                        <asp:Button ID="btnConfirm" runat="server" Enabled="False" SkinID="skBtnBase" Text="Confirm Transaction" 
                                            OnClientClick="return confirm('Are you sure you want to confirm this transaction? Did you print it?')"/> 
                                            
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="dummy" runat="server" />
                            <asp:ModalPopupExtender ID="mdlPopup" runat="server" PopupControlID="popPanel" OkControlID="btnYes"
                                DropShadow="True" BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
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
                                            <p style="text-align: right;" class="GridRow1T">
                                                <br />
                                                <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <div style="padding: 5px; height: 30px;">
            <asp:Button ID="btnReport" runat="server" CausesValidation="False" SkinID="skBtnBase" Text="Report" />&nbsp;
            <asp:Button ID="btnReportBach" runat="server" CausesValidation="False" SkinID="skBtnBase" Text="Batch Report" Visible="False" />
            
            <asp:ObjectDataSource ID="dsAccTranAppl" runat="server" SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccTranApplTableAdapter"
                DeleteMethod="AccApplicationDelete" InsertMethod="AccApplicationInsert" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TransID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="ApplyDocID" Type="Int32" />
                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TranID" PropertyName="Text" Type="Int32" />
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="cbShowCancel" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TransID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="ApplyDocID" Type="Int32" />
                    <asp:Parameter Name="ApplyAmount" Type="Decimal" />
                    <asp:Parameter Name="ApplyComment" Type="String" />
                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsAccDocStatus" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsDocHeader" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocHeaderTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsAccDocToApply" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccDocToApplyTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="fltInvFrom" Name="DocNumberFrom" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="fltInvTo" Name="DocNumberTo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
                <%--SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.SelectAccTranApplTableAdapter">--%>
            <asp:ObjectDataSource ID="dsApplications" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.ReportAccTranApplTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TranID" PropertyName="Text" Type="Int32" />
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="cbShowCancel" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsAccTranApplFil" runat="server" SelectMethod="GetData"
                TypeName="dsAccountingTableAdapters.SelectAccTranApplTableAdapter" DeleteMethod="AccApplicationDelete"
                InsertMethod="AccApplicationInsert">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TransID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="ApplyDocID" Type="Int32" />
                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                        Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TranID" PropertyName="Text" Type="Int32" />
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="cbShowCancel" Name="ShowCancel" PropertyName="Checked"
                        Type="Boolean" />
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TransID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="ApplyDocID" Type="Int32" />
                    <asp:Parameter Name="ApplyAmount" Type="Decimal" />
                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsBatch" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.SelectAccTranApplTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblTransID" Name="TranID" PropertyName="Text" Type="Int32" />
                    <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    <asp:ControlParameter ControlID="cbShowCancel" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
