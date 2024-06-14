<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccBookApplication.aspx.vb" 
    Inherits="Accounting_AccBookApplication" MaintainScrollPositionOnPostback="true" %>

<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application by Booking</title>
</head>
<body>
    <%-- width: 1090px + 17px --%>
    <form id="accBookApplication" runat="server">
        <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="Blue">
                    <div class="GridLabelBG">
                    <asp:Label ID="lbDetails" runat="server" Text="Application by Booking" SkinID="skGridLabel" />
                    </div>
                </td>
            </tr>
            <tr>
                <td style="border: solid 2px #005C99; padding: 0px 4px 0px 4px; background-color: White;">
        <div style="overflow: auto;">
        <div class="Blue">
            <asp:FormView ID="fvTransaction" runat="server" DataKeyNames="TransID,TransDate,Balance,TransNote" DataSourceID="dsSrcDocument">
                <ItemTemplate>
                    <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" >
                        <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                            <td class="GridRow2B" style="width: 90px;">Date</td>
                            <td class="GridRow2B" style="width: 100px;">Document</td>
                            <td class="GridRow2B" style="width: 100px;">Bk.Number</td>
                            <td class="GridRow2B" style="width: 200px;">Guest Name</td>
                            <td class="GridRow2B" style="width: 80px; text-align: center;">Eff.Balance</td>
                            <td class="GridRow2B" style="text-align: center;" colspan="2">Applied</td>
                            <td class="GridRow2B" style="width: 300px;">Comment</td>
                            <td class="GridRow2B" style="width: 50px;">&nbsp;</td>
                            <td rowspan="2" style="width: 17px;"></td>
                        </tr>
                        <tr style="vertical-align: middle; height: 30px; font-weight: bold;">
                            <td class="GridRow1B" style="padding-right: 5px; padding-left: 5px;">
                                <%# Eval("TransDate","{0:d}") %>
                            </td>
                            <td class="GridRow1B" >
                                <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                            </td>
                            <td class="GridRow1B" >&nbsp;</td>
                            <td class="GridRow1B" >&nbsp;</td>
                            <td class="GridRow1B" style="text-align: right;">
                                <%# Eval("Balance","{0:N2}") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <%# Eval("DebitAmount","{0:N2}") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">&nbsp;</td>
                            <td class="GridRow1B">
                                <%# Eval("TransNote") %>
                            </td>
                            <td class="GridRow1B" style="width: 50px;">
                                <asp:ImageButton ID="btnTransEdit" runat="server" CausesValidation="True" CommandName="Edit"
                                    ImageUrl="~/Images/edit_inline.gif" Text="Edit" CssClass="ImgButton"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <asp:DataList ID="dlDetails" runat="server" DataSourceID="dsDetDocument"
                                    OnEditCommand="dlDetails_Edit" 
                                    OnDeleteCommand="dlDetails_Delete" 
                                    OnUpdateCommand="dlDetails_Update"
                                    OnCancelCommand="dlDetails_Cancel" >
                                    <ItemTemplate>
                                            <tr>
                                                <td class="GridRowClear" style="width: 90px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 100px;">
                                                    <asp:HiddenField ID="hf_transOrd" runat="server" Value='<%# Eval("TransOrd") %>' />
                                                    <asp:HiddenField ID="hf_ftrtID" runat="server" Value='<%# Eval("DocumentID") %>' />
                                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                                </td>
                                                <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 200px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 300px;">
                                                    <%# Eval("DetailNote") %>
                                                </td>
                                                <td class="GridRowClear" style="width: 50px; height: 20px;">
                                                    <asp:ImageButton ID="btnDetailEdit" runat="server" CausesValidation="True" CommandName="Edit"
                                                        ImageUrl="~/Images/edit_inline.gif" Text="Edit" CssClass="ImgButton"/>
                                                    <asp:ImageButton ID="btnDetailDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/Images/delete_inline.gif" Text="Delete" CssClass="ImgButton"
                                                        CommandArgument='<%# Eval("DocumentID") %>'
                                                        OnClientClick="return confirm('Are you sure you want to delete invoice application?')"/>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="2" class="GridRow1B">&nbsp;</td>
                                                <td colspan="6" class="GridRow1B" style="padding: 0px;">
                                                    <asp:DataList ID="dlBookings" runat="server" DataKeyField="DocumentID" DataSourceID="dsDetBookings">
                                                        <ItemTemplate>
                                                                <tr>
                                                                    <td class="GridRowClear" style="width: 100px; padding: 0px;">
                                                                        <asp:HiddenField ID="hf_detailID" runat="server" Value='<%# Eval("DetailID") %>' />
                                                                        <%# Eval("BookingVoucher") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 200px; padding: 0px;">
                                                                        <%# Eval("DetText") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px; text-align: right;">
                                                                        <%# Eval("stayBalance","{0:N2}") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px;">&nbsp;</td>
                                                                    <td class="GridRowClear" style="width: 80px; text-align: right;">
                                                                        <span style="padding-right: 5px;">
                                                                        <%# Eval("appAmount","{0:N2}") %>
                                                                        </span>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 300px; padding: 0px;">&nbsp;</td>
                                                                </tr>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    
                                                    <asp:ObjectDataSource ID="dsDetBookings" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                        TypeName="dsAccBookApplicationTableAdapters.DetBookingsTableAdapter" 
                                                        FilterExpression="Applied = 1" >
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hf_ftrtID" Name="FtID" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="GridRow1B" >&nbsp;</td>
                                            </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                            <tr>
                                                <td class="GridRowClear" style="width: 90px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 100px;">
                                                    <asp:HiddenField ID="hf_transOrd" runat="server" Value='<%# Eval("TransOrd") %>' />
                                                    <asp:HiddenField ID="hf_ftrtID" runat="server" Value='<%# Eval("DocumentID") %>' />
                                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                                </td>
                                                <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 200px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 300px;">
                                                    <span style="padding-left: 4px;">
                                                    <asp:TextBox ID="txt_documentNote" runat="server" Text='<%# Bind("DetailNote") %>' CssClass="TextBox" Width="280px" />
                                                    </span>
                                                </td>
                                                <td class="GridRowClear" style="width: 50px;">
                                                    <asp:ImageButton ID="btnDetailUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                                        CommandArgument='<%# Eval("TransOrd") %>'
                                                        ImageUrl="~/Images/accept_inline.gif" Text="Update" CssClass="ImgButton"/>
                                                    <asp:ImageButton ID="btnDetailCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        ImageUrl="~/Images/decline_inline.gif" Text="Cancel" CssClass="ImgButton"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="GridRow1B">&nbsp;</td>
                                                <td colspan="6" class="GridRow1B" id="edit" style="padding: 0px;">
                                                    <asp:DataList ID="dlBookings" runat="server" DataKeyField="DocumentID" DataSourceID="dsDetBookings">
                                                        <ItemTemplate>
                                                                <tr>
                                                                    <td class="GridRowClear" style="width: 100px; padding: 0px;">
                                                                        <asp:HiddenField ID="hf_detailID" runat="server" Value='<%# Eval("DetailID") %>' />
                                                                        <%# Eval("BookingVoucher") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 200px; padding: 0px;">
                                                                        <%# Eval("DetText") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px; text-align: right;">
                                                                        <%# Eval("stayBalance","{0:N2}") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px;">&nbsp;</td>
                                                                    <td class="GridRowClear" style="width: 80px;text-align: right;">
                                                                        <span style="padding-right: 5px;">
                                                                        <%# Eval("appAmount","{0:N2}") %>
                                                                        </span>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 300px; padding: 0px;">
                                                                        <asp:Label ID="lbl_detailError" runat="server" style=" color: Red; padding-left: 10px; font-weight: bold; font-style: italic;" />
                                                                    </td>
                                                                </tr>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <asp:ObjectDataSource ID="dsDetBookings" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                        TypeName="dsAccBookApplicationTableAdapters.DetBookingsTableAdapter" >
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hf_ftrtID" Name="FtID" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="GridRow1B">&nbsp;</td>
                                            </tr>
                                    </EditItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" >
                        <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                            <td class="GridRow2B" style="width: 90px;">Date</td>
                            <td class="GridRow2B" style="width: 100px;">Document</td>
                            <td class="GridRow2B" style="width: 100px;">Bk.Number</td>
                            <td class="GridRow2B" style="width: 200px;">Guest Name</td>
                            <td class="GridRow2B" style="width: 80px; text-align: center;">Eff.Balance</td>
                            <td class="GridRow2B" style="text-align: center;" colspan="2">Applied</td>
                            <td class="GridRow2B" style="width: 300px;">Comment</td>
                            <td class="GridRow2B" style="width: 50px;">&nbsp;</td>
                            <td rowspan="2" style="width: 17px;"></td>
                        </tr>
                        <tr style="vertical-align: middle; height: 30px; font-weight: bold;">
                            <td class="GridRow1B" style="padding-right: 5px; padding-left: 5px;">
                            <div style="width: 80px;">
                                <uc:InputDateControl ID="ctr_transDate" runat="server" DateValue='<%# Bind("TransDate","{0:d}") %>' 
                                    ReadOnly='<%# Eval("TransID")<>0 %>' />
                            </div>
                            </td>
                            <td class="GridRow1B" >
                                <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                            </td>
                            <td class="GridRow1B" >&nbsp;</td>
                            <td class="GridRow1B" >&nbsp;</td>
                            <td class="GridRow1B" style="text-align: right;">
                                <%# Eval("Balance","{0:N2}") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <%# Eval("DebitAmount","{0:N2}") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">&nbsp;</td>
                            <td class="GridRow1B" style="width: 300px;">
                                <span style="padding-left: 5px;">
                                <asp:TextBox ID="txt_transNote" runat="server" Text='<%# Bind("TransNote") %>' CssClass="TextBox" Width="280px" />
                                </span>
                            </td>
                            <td class="GridRow1B" style="width: 50px;">
                                <asp:ImageButton ID="btnTransUpdate" runat="server" CausesValidation="True" CommandName="TransUpdate"
                                    Visible='<%# Eval("TransID") <> 0 %>' CssClass="ImgButton"
                                    ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                <asp:ImageButton ID="btnTransCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Visible='<%# Eval("TransID") <> 0 %>' CssClass="ImgButton"
                                    ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <asp:DataList ID="dlDetails" runat="server" DataSourceID="dsDetDocument" >
                                    <ItemTemplate>
                                            <tr>
                                                <td class="GridRowClear" style="width: 90px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 100px;">
                                                    <asp:HiddenField ID="hf_transOrd" runat="server" Value='<%# Eval("TransOrd") %>' />
                                                    <asp:HiddenField ID="hf_ftrtID" runat="server" Value='<%# Eval("DocumentID") %>' />
                                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                                </td>
                                                <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 200px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                                                <td class="GridRowClear" style="width: 300px;">
                                                    <%# Eval("DetailNote") %>
                                                </td>
                                                <td class="GridRowClear" style="width: 50px; height: 20px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="GridRow1B">&nbsp;</td>
                                                <td colspan="6" class="GridRow1B" style="padding: 0px;">
                                                    <asp:DataList ID="dlBookings" runat="server" DataKeyField="DocumentID" DataSourceID="dsDetBookings">
                                                        <ItemTemplate>
                                                                <tr>
                                                                    <td class="GridRowClear" style="width: 100px; padding: 0px;">
                                                                        <asp:HiddenField ID="hfInvoiceID" runat="server" Value='<%# Eval("InvoiceId") %>' />
                                                                        <asp:HiddenField ID="hf_detailID" runat="server" Value='<%# Eval("DetailID") %>' />
                                                                        <%# Eval("BookingVoucher") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 200px; padding: 0px;">
                                                                        <%# Eval("DetText") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px; text-align: right;">
                                                                        <%# Eval("stayBalance","{0:N2}") %>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 80px; padding: 0px;">&nbsp;</td>
                                                                    <td class="GridRowClear" style="width: 80px; text-align: right;">
                                                                        <span style="padding-right: 5px;">
                                                                        <%# Eval("appAmount","{0:N2}") %>
                                                                        </span>
                                                                    </td>
                                                                    <td class="GridRowClear" style="width: 300px; padding: 0px;">&nbsp;</td>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    
                                                    <asp:ObjectDataSource ID="dsDetBookings" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                        TypeName="dsAccBookApplicationTableAdapters.DetBookingsTableAdapter" 
                                                        FilterExpression="Applied = 1" >
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hf_ftrtID" Name="FtID" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="GridRow1B" >&nbsp;</td>
                                            </tr>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
            <asp:HiddenField ID="hf_ftrtID" runat="server" Value="386008" />
            <asp:Panel ID="pnlNewDetail" runat="server">
                <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" >
                    <tr>
                        <td class="GridRowClear" style="width: 90px;text-align: right;">
                            <asp:Image ID="btnDetailAdd" runat="server" ImageUrl="~/Images/plus.gif" Height="12px"/>&nbsp;
                        </td>
                        <td class="GridRowClear" style="width: 100px;">
                            <asp:TextBox ID="txtInvoice" runat="server" CssClass="TextBox" ReadOnly="true" Width="90px" />
                        </td>
                        <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 200px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 300px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 50px;">&nbsp;</td>
                    </tr>
                </table>                    

                <asp:PopupControlExtender ID="popFt2ApplyImg" runat="server" CommitProperty="Text" 
                    PopupControlID="popFt2Apply"
                    TargetControlID="btnDetailAdd" 
                    Position="Bottom" OffsetX="15" OffsetY="-112">
                </asp:PopupControlExtender>
                <asp:PopupControlExtender ID="popFt2ApplyTxt" runat="server" CommitProperty="Text" 
                    PopupControlID="popFt2Apply"
                    TargetControlID="txtInvoice"
                    Position="Bottom" OffsetY="-118" >
                </asp:PopupControlExtender>
                <div id="popFt2Apply" class="GridBorder" style="width: 207px; max-height: 176px; margin: 2px; overflow: auto; background-color: White;">
                <asp:GridView ID="gvFt2Apply" runat="server" AutoGenerateColumns="False"
                    ShowFooter="False" ShowHeader="false" GridLines="None"
                    DataKeyNames="DocumentID,DocCode,DocNumber,Balance"
                    DataSourceID="Ft2Apply" 
                    onselectedindexchanged="gvFt2Apply_SelectedIndexChanged" >
                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                    <SelectedRowStyle CssClass="SelectRowClear" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False" ShowSelectButton="True">
                            <ItemStyle Width="15px" />
                        </asp:CommandField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbNewInvoice" runat="server" Text='<%# Eval("DocCode") & " " & Eval("DocNumber") %>' 
                                    CommandName="Select" ToolTip='<%# Eval("DocumentID") %>' />
                            </ItemTemplate>
                            <ItemStyle Width="90px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Balance" SortExpression="Balance" DataFormatString="{0:N2}">
                            <ItemStyle Width="77px" Wrap="false" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>&nbsp;</ItemTemplate>
                            <ItemStyle Width="5px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No invoices to apply!
                    </EmptyDataTemplate>
                </asp:GridView>
                </div>
            </asp:Panel>
        </div>
        <div class="Red">
            <asp:Panel ID="pnlNewInvoice" runat="server" Visible="false" style="margin-top: 2px; margin-bottom: 2px;" >
                <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" >
                    <tr>
                        <td class="GridRowClear" style="width: 90px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 100px; font-weight: bold;">
                            <asp:Label ID="lbl_ftrt" runat="server" style="padding-left: 2px;" />
                        </td>
                        <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 200px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 80px;">&nbsp;</td>
                        <td class="GridRowClear" style="width: 300px;">
                            <span style="padding-left: 5px;">
                            <asp:TextBox ID="txt_ftrtNote" runat="server" CssClass="TextBox" Width="280px" />
                            </span>
                        </td>
                        <td class="GridRowClear" style="width: 50px;">
                            <asp:ImageButton ID="btnNewUpdate" runat="server" CausesValidation="True" CssClass="ImgButton" 
                                ImageUrl="~/Images/accept_inline.gif" Text="Update" style="width: 12px" />
                            <asp:ImageButton ID="btnNewCancel" runat="server" CausesValidation="False" CssClass="ImgButton"
                                ImageUrl="~/Images/decline_inline.gif" Text="Cancel" style="height: 14px" />
                        </td>
                    </tr>
                </table>
                <asp:DataList ID="dlNewInvoice" runat="server" DataKeyField="DocumentID" DataSourceID="dsNewInvoice">
                    <HeaderTemplate>
                        <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" > 
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td class="GridRowClear" style="width: 90px;">&nbsp;</td>
                                <td class="GridRowClear" style="width: 100px;">&nbsp;</td>
                                <td class="GridRowClear" style="width: 100px;">
                                    <asp:HiddenField ID="hf_invoiceID" runat="server" Value='<%# Eval("InvoiceId") %>' />
                                    <asp:HiddenField ID="hf_detailID" runat="server" Value='<%# Eval("DetailID") %>' />
                                    <%# Eval("BookingVoucher") %>
                                </td>
                                <td class="GridRowClear" style="width: 200px;">
                                    <%# Eval("DetText") %>
                                </td>
                                <td class="GridRowClear" style="width: 80px;text-align: right;">
                                    <asp:Label ID="lbl_detailBalance" runat="server" Text='<%# Eval("stayEditBalance","{0:N2}") %>' />
                                </td>
                                <td class="GridRowClear" style="width: 80px; text-align: right;">
                                    <asp:ImageButton ID="btSetAmount" runat="server" ImageUrl="~/Images/right_one_red.png" />
                                </td>
                                <td class="GridRowClear" style="width: 80px; text-align: right;">
                                    <asp:TextBox ID="txt_detailAmount" runat="server" CssClass="TextBox" style="text-align: right;" 
                                        Text='<%# Eval("appAmount","{0:F2}") %>' Width="75px" />
                                    <asp:CompareValidator ID="dec_txt_detailAmount" runat="server" Display="None" 
                                        ErrorMessage="Input a valid amount (group separator is not allowed)!" 
                                        Operator="DataTypeCheck" Type="Double"
                                        ControlToValidate="txt_detailAmount"/>
                                    <asp:ValidatorCalloutExtender ID="ca_dec_txt_detailAmount" runat="server" 
                                        TargetControlID="dec_txt_detailAmount" />
                                    <asp:RequiredFieldValidator ID="req_txt_detailAmount" runat="server" Display="None"
                                        ErrorMessage="Required field"
                                        ControlToValidate="txt_detailAmount" />
                                    <asp:ValidatorCalloutExtender ID="ca_req_txt_detailAmount" runat="server" 
                                        TargetControlID="req_txt_detailAmount" />
                                    <asp:RangeValidator ID="rng_txt_detailAmount" runat="server" Display="None" 
                                        ControlToValidate="txt_detailAmount" Type="Double" 
                                        MinimumValue="0" MaximumValue='<%# Eval("stayEditBalance") %>' 
                                        ErrorMessage="Amount is out of range!" />
                                    <asp:ValidatorCalloutExtender ID="ca_rng_txt_detailAmount" runat="server" 
                                        TargetControlID="rng_txt_detailAmount" />
                                </td>
                                <td class="GridRowClear" style="width: 300px;">
                                    <asp:ImageButton ID="btResetAmount" runat="server" ImageUrl="~/Images/cancel_big.gif" style="float: left;" />
                                    <asp:Label ID="lbl_detailError" runat="server" style="color: Red; padding-left: 10px; font-weight: bold; font-style: italic;" />
                                </td>
                                <td class="GridRowClear" style="width: 50px;">&nbsp;</td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:DataList>

                <asp:ObjectDataSource ID="dsNewInvoice" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="dsAccBookApplicationTableAdapters.DetBookingsTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                        <asp:ControlParameter ControlID="hf_ftrtID" Name="FtID" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </div>
        <div class="Blue">
            <asp:FormView ID="fvTransFooter" runat="server" DataKeyNames="TransID" DataSourceID="dsSrcDocument">
                <ItemTemplate>
                    <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;" >
                        <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                            <td class="GridRow1T" style="width: 90px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 100px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 100px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 200px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 80px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 80px; text-align: right;">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DebitAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1T" style="width: 80px; text-align: right;">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("DebitAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1T" style="width: 300px;">&nbsp;</td>
                            <td class="GridRow1T" style="width: 50px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="GridRow2T" colspan="7">&nbsp;</td>
                            <td class="GridRow2T" colspan="2" style="text-align: right; height: 28px; padding-top: 5px;">
                                <asp:Button ID="btFinish" runat="server" Text="Finish" SkinID="skBtnBase" CommandName="TransFinish" Visible='<%# Eval("TransID") <> 0 %>' />&nbsp;
                                <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="TransDelete" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <uc:MessagePop ID="msgPop" runat="server" Title="Application by Booking" />
            
            <asp:Panel ID="pnlReport" runat="server" Width="1090px" Visible="false">
                <h3 style="text-align: center;">Transaction is confirmed. You can print Batch report or close this form.</h3>
                <div style="height: 30px; text-align: right; padding-right: 17px;">
                <asp:Button ID="btnBatch" runat="server" SkinID="skBtnBase" Text="Batch"/>&nbsp;&nbsp;
                <asp:Button ID="btnBatchByBookings" runat="server" SkinID="skBtnBase" Text="Batch by Bookings"/>&nbsp;&nbsp;
                <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" />
                </div>
            </asp:Panel>
        </div>
        </div>
                </td>
            </tr>
        </table>
        
        <asp:ObjectDataSource ID="dsSrcDocument" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataEffective" 
            TypeName="dsAccBookApplicationTableAdapters.SrcDocumentTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDetDocument" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsAccBookApplicationTableAdapters.DetDocumentTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="Ft2Apply" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsAccBookApplicationTableAdapters.Ft2ApplyTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
        <asp:ObjectDataSource ID="dsAccDocStatus" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
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
                <asp:QueryStringParameter Name="TranID" QueryStringField="TransID" Type="Int32" />
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                <asp:Parameter Name="ShowCancel" Type="Boolean" DefaultValue="False" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsApplicationsBook" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.ReportAccTranApplBookTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="TranID" QueryStringField="TransID" Type="Int32" />
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                <asp:Parameter Name="ShowCancel" Type="Boolean" DefaultValue="False" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
