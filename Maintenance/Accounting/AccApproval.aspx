<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master"
    AutoEventWireup="false" CodeFile="AccApproval.aspx.vb" Inherits="Maintenance_Accounting_AccApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Accounting Limits
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="2">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblProration" runat="server" SkinID="skGridLabel" Text="Accounting Proration Limit" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:FormView ID="fvProration" runat="server" DataSourceID="dsProration" DataKeyNames="ProrationLimit">
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Proration Limit</b>
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <asp:TextBox ID="txtProration" runat="server" CssClass="TextBox" Text='<%# Bind("ProrationLimit","{0:F2}") %>'/>
                                                <asp:CompareValidator ID="dec_txtProration" runat="server" Display="None" 
                                                    ErrorMessage="Input a valid amount (group separator is not allowed)!" 
                                                    Operator="DataTypeCheck" Type="Double"
                                                    ControlToValidate="txtProration"/>
                                                <asp:ValidatorCalloutExtender ID="ca_dec_txtProration" runat="server" 
                                                    TargetControlID="dec_txtProration" />
                                                <asp:RequiredFieldValidator ID="req_txtProration" runat="server" Display="None"
                                                    ErrorMessage="Required field"
                                                    ControlToValidate="txtProration" />
                                                <asp:ValidatorCalloutExtender ID="ca_req_txtProration" runat="server" 
                                                    TargetControlID="req_txtProration" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 27px; text-align: right; padding-top: 5px;">
                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" SkinID="skBtnBase"
                                                    CommandName="Update" Text="Update" />
                                                &nbsp;
                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" SkinID="skBtnBase"
                                                    CommandName="Cancel" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Proration Limit</b>
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <asp:Label ID="lblProrationAmount" runat="server" Text='<%# Bind("ProrationLimit","{0:N2}") %>'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 27px; text-align: right; padding-top: 5px;">
                                                <asp:Button ID="EditButton" runat="server" CausesValidation="False" SkinID="skBtnBase"
                                                    CommandName="Edit" Text="Edit" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>

                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="0" cellspacing="2">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblLimits" runat="server" SkinID="skGridLabel" Text="Accounting Approval Limits" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:FormView ID="fvLimits" runat="server" DataKeyNames="ApproveRowID" DataSourceID="dsLimits">
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                        <tr>
                                            <td class="GridRow2B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Approval Role</b>
                                            </td>
                                            <td class="GridRow2B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Approval Limit</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 0px 0px 0px 5px;">
                                                accounting_approve_A
                                            </td>
                                            <td class="GridRow1B" style="padding: 0px 0px 0px 5px;">
                                                <asp:TextBox ID="ApproveLimit_ATextBox" runat="server" CssClass="TextBox" Text='<%# Bind("ApproveLimit_A","{0:N2}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 0px 0px 0px 5px;">
                                                accounting_approve_B
                                            </td>
                                            <td class="GridRow1B" style="padding: 0px 0px 0px 5px;">
                                                <asp:TextBox ID="ApproveLimit_BTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("ApproveLimit_B","{0:N2}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                accounting_approve_C
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                any
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 27px; text-align: right; padding-top: 5px;">
                                                <asp:HiddenField ID="hfRowID" runat="server" Value='<%# Eval("ApproveRowID") %>' />
                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" SkinID="skBtnBase"
                                                    CommandName="Update" Text="Update" />
                                                &nbsp;
                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" SkinID="skBtnBase"
                                                    CommandName="Cancel" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px">
                                        <tr>
                                            <td class="GridRow2B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Approval Role</b>
                                            </td>
                                            <td class="GridRow2B" style="padding: 4px 0px 4px 5px; width: 50%;">
                                                <b>Approval Limit</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                accounting_approve_A
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                <asp:Label ID="ApproveLimit_ALabel" runat="server" Text='<%# Bind("ApproveLimit_A","{0:N2}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                accounting_approve_B
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ApproveLimit_B","{0:N2}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                accounting_approve_C
                                            </td>
                                            <td class="GridRow1B" style="padding: 4px 0px 4px 5px;">
                                                any
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 27px; text-align: right; padding-top: 5px;">
                                                <asp:HiddenField ID="hfRowID" runat="server" Value='<%# Eval("ApproveRowID") %>' />
                                                <asp:Button ID="EditButton" runat="server" CausesValidation="False" SkinID="skBtnBase"
                                                    CommandName="Edit" Text="Edit" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsLimits" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUserReportTableAdapters.AccApproveLimitTableAdapter"
                    UpdateMethod="Update">
                    <UpdateParameters>
                        <asp:Parameter Name="ApproveLimit_A" Type="Decimal" />
                        <asp:Parameter Name="ApproveLimit_B" Type="Decimal" />
                        <asp:Parameter Name="Original_ApproveRowID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ApproveRowID" Type="Int32" />
                        <asp:Parameter Name="ApproveLimit_A" Type="Decimal" />
                        <asp:Parameter Name="ApproveLimit_B" Type="Decimal" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsProration" runat="server" 
                    TypeName="dsAccProrationTableAdapters.AccApproveLimitTableAdapter"
                    SelectMethod="GetData" UpdateMethod="UpdateQuery">
                    <UpdateParameters>
                        <asp:Parameter Name="ProrationLimit" Type="Decimal" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
