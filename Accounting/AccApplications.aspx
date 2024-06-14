<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master"
    AutoEventWireup="false" CodeFile="AccApplications.aspx.vb" Inherits="Accounting_AccApplications"
    MaintainScrollPositionOnPostback="true" ValidateRequest="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
<%@ MasterType VirtualPath="~/Accounting/masterAccounting.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Applications
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanelMain" runat="server">
        <ContentTemplate>--%>
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDetails" runat="server" Text="Applied Documents" SkinID="skGridLabel"/>
                    <asp:CheckBox ID="cbHotel" runat="server" Text="Show Htl.Amount" TextAlign="Left" 
                        AutoPostBack="True" style="float: right; margin-right: 5px; color: White;"/>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:HiddenField ID="hfUser" runat="server" />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="dummy" runat="server" />
                                        <%--
                                        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                                            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                                            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                                        </asp:ModalPopupExtender>
                                        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                <tr>
                                                    <td class="GridLabelBG">
                                                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="GridBorder">
                                                        <p style="text-align: center;">
                                                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                                                        </p>
                                                        <p style="text-align: right;" class="GridRow2T">
                                                            <br />
                                                            <asp:Button ID="btnNo" runat="server" Text="Ok" SkinID="skBtnBase" />&nbsp;
                                                        </p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        --%>
                                        <asp:GridView ID="gvApplications" runat="server" AutoGenerateColumns="False" DataSourceID="dsApplications"
                                            SkinID="skGridView" ShowFooter="True" DataKeyNames="TranID,DocID">
                                            <Columns>
                                                <asp:BoundField DataField="TranID" ReadOnly="true">
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TransDate" DataFormatString="{0:d}" HeaderText="TransDate" ReadOnly="true">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DocID" HeaderText="DocID" ReadOnly="true">
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <%--<asp:BoundField DataField="DocDate" DataFormatString="{0:d}" HeaderText="DocDate" ReadOnly="true">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>--%>
                                                <asp:TemplateField HeaderText="Document">
                                                    <ItemTemplate>
                                                        <a href='<%# "AccDocDetail.aspx?DocumentID=" & Eval("DocID") %>'>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DocCode") %>' />
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DocNumber") %>' />
                                                        </a>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DocAccount" HeaderText="Account" FooterText="Balance:" ReadOnly="true">
                                                    <ItemStyle Width="80px" />
                                                    <FooterStyle Font-Bold="True" Font-Italic="True" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Amount" DataFormatString="{0:N2}" HeaderText="Amount" ReadOnly="true">
                                                    <ItemStyle Width="80px" HorizontalAlign="Right" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="HAmount" DataFormatString="{0:N2}" HeaderText="Htl.Amount" ReadOnly="true">
                                                    <ItemStyle Width="80px" HorizontalAlign="Right" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>&nbsp;</ItemTemplate>
                                                    <ItemStyle Width="10px" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Application Comment" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtNote" runat="server" Text='<%# Bind("AppNote") %>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtNote" runat="server" Text='<%# Bind("AppNote") %>' CssClass="TextBox" />
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="300px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnNoteEdit" runat="server" CommandName="Edit"
                                                            ImageUrl="~/Images/edit_inline.gif" />
                                                        <asp:ImageButton ID="btnNoteClear" runat="server" CommandName="ClearNote"
                                                            ImageUrl="~/Images/delete_inline.gif" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:ImageButton ID="btnNoteUpdate" runat="server" CommandName="SetNote"
                                                            ImageUrl="~/Images/accept_inline.gif" />
                                                        <asp:ImageButton ID="btnNoteCancel" runat="server" CommandName="Cancel"
                                                            ImageUrl="~/Images/delete_inline.gif" />
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCancel" runat="server" Visible='<%# Eval("Canceled") %>' 
                                                            Text="Canceled" Font-Italic="true" ForeColor="Red" />
                                                        <asp:LinkButton ID="btDeapply" runat="server" Text="Disapply" CommandName="Deapply"
                                                            OnClientClick="return confirm('Are you sure you want to disapply the record')"
                                                            CommandArgument='<%# Eval("DocID") %>' Visible='<%# Eval("CanDeapply") %>' />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:LinkButton ID="btDeapply" runat="server" OnClick="btDeapply_Click" 
                                                            OnClientClick="return confirm('Are you sure you want to disapply the record')"
                                                            Text="Disapply All" />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="80px" CssClass="Red" HorizontalAlign="Right" />
                                                    <FooterStyle CssClass="Red" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div style="width: 990px; height: 30px; padding-left: 10px; padding-top: 5px; font-weight: bold;">
                                                    This document has no applications.
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <uc:MessagePop ID="msgPop" runat="server" Title="Accounting Document Applications" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow2T" style="width: 380px; padding: 4px 0px 5px 0px;">
                                <div style="padding: 4px; border: solid 1px;" >
                                <asp:CheckBox ID="cbCanceled" runat="server" Text="Show Canceled" TextAlign="Left" AutoPostBack="True" style="margin-left: 5px;" />
                                <asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" style="margin-left: 5px;" />
                                <asp:Button ID="btnBatch" runat="server" CausesValidation="False" SkinID="skBtnBase" Text="Batch Report" style="margin-left: 5px;" />
                                <asp:Button ID="btnBatchBook" runat="server" CausesValidation="False" SkinID="skBtnBase" Text="Batch By Book" style="margin-left: 5px;"/>
                                </div>
                            </td>
                            <td class="GridRow2T" style="vertical-align: middle; padding: 8px 0px 5px 0px; text-align: right;">
                                <asp:Button ID="btnByBooking" runat="server" SkinID="skBtnBase" Text="Apply by Bookings" style="margin-left: 5px;" />
                                <asp:Button ID="btnApply" runat="server" SkinID="skBtnBase" Text="Apply" style="margin-left: 5px;" />
                                <asp:Button ID="btnTransfer" runat="server" SkinID="skBtnBase" Text="Transfer" style="margin-left: 5px;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnRefresh" runat="server" Style="display: none;"  />
        <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
            ID="popByBookExtender" X="0" Y="160" 
            TargetControlID="btnByBooking" 
            OkControlID="byBookOK" 
            CancelControlID="byBookCancel"
            PopupControlID="popByBookDiv" >
        </asp:ModalPopupExtender>
        <div style="display: none">
            <input id="byBookOK" value="Done" type="button" />
            <input id="byBookCancel" value="Cancel" type="button" />
        </div>
        <div id="popByBookDiv" style="display: none; overflow: auto;">
            <iframe id="IframeBook" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
                scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByBookingSrc()%>'  >
            </iframe>
        </div>

        <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
            ID="popByAnyExtender" X="0" Y="160" 
            TargetControlID="btnApply" 
            OkControlID="byAnyOK" 
            CancelControlID="byAnyCancel"
            PopupControlID="popByAnyDiv" >
        </asp:ModalPopupExtender>
        <div style="display: none">
            <input id="byAnyOK" value="Done" type="button" />
            <input id="byAnyCancel" value="Cancel" type="button" />
        </div>
        <div id="popByAnyDiv" style="display: none; overflow: auto;">
            <iframe id="IframeAny" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
                scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByAnySrc()%>'  >
            </iframe>
        </div>

    </div>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:ObjectDataSource ID="dsApplications" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccDocApplTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" DefaultValue="" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsDocHeader" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocHeaderTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAppStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTransactionsRpt" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.RptTransferDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" DefaultValue="" Name="ShowCancel" PropertyName="Checked"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBatch" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccDocBatchTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBatchBook" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccDocBatchBookingTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
