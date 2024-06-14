<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master"
    AutoEventWireup="false" CodeFile="AccInvBooking.aspx.vb" Inherits="Accounting_AccInvBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Invoice Booking Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="pnlMain" UpdateMode="Conditional">
            <ContentTemplate>
  
   <div class="Blue">
    <table cellpadding="0" cellspacing="2">
        <tr>
            <td class="GridLabelBG">
                <asp:Label ID="lbDetails" runat="server" Text="Invoice" SkinID="skGridLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="GridBorder" valign="top">
                <asp:DetailsView ID="invDetail" runat="server" AutoGenerateRows="False" DataKeyNames="InvoiceID"
                    DataSourceID="dsAccInvoice" Height="50px" SkinID="skDetailView" Width="400px">
                    <FieldHeaderStyle Width="100px" />
                    <Fields>
                        <asp:TemplateField HeaderText="InvoiceID" InsertVisible="False" ShowHeader="False"
                            SortExpression="InvoiceID">
                            <ItemTemplate>
                                <b>
                                    <asp:Label ID="Label6" runat="server" Text='<%# "[" & Eval("InvoiceID") & "] Invoice" %>' />
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("InvNumber") %>' />
                                </b>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="InvDate" HeaderText="Invoice Date" SortExpression="InvDate"
                            DataFormatString="{0:d}" />
                        <asp:BoundField DataField="InvTypeName" HeaderText="Invoice Type" SortExpression="InvTypeName" />
                        <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" />
                        <asp:TemplateField HeaderText="Invoice Stay" SortExpression="CheckIn">
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("CheckIn", "{0:d}") & " - " & Eval("CheckOut", "{0:d}") %>' />
                                <i>(
                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("Nights") & " nights" %>' Visible='<%# Eval("Nights")>1 %>' />
                                    <asp:Label ID="Label23" runat="server" Text='<%# Eval("Nights") & " night" %>' Visible='<%# Eval("Nights")=1 %>' />
                                    )</i>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                            <ItemTemplate>
                                <asp:Label ID="Label24" runat="server" Text='<%# Bind("Amount","{0:N2}") %>'></asp:Label>
                                <asp:Label ID="Label25" runat="server" Text='<%# Bind("HAmount","{0:N2}") %>' Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="InvRefText" HeaderText="Reference" SortExpression="InvRefText" />
                        <asp:BoundField DataField="InvPrnText" HeaderText="Note" SortExpression="InvPrnText" />
                        <asp:BoundField DataField="InvComment" HeaderText="Comment" SortExpression="InvComment" />
                        <asp:BoundField DataField="InvoiceState" HeaderText="Invoice State" SortExpression="InvoiceState" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" SortExpression="DeliveryDate"
                            DataFormatString="{0:d}" />
                    </Fields>
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="dsAccInvoice" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccInvoiceTableAdapters.AccInvoiceTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="DocumentID" QueryStringField="DocumentID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <table cellpadding="0" cellspacing="2">
        <tr>
            <td class="GridLabelBG">
                <asp:Label ID="Label8" runat="server" Text="Invoice Bookings" SkinID="skGridLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="GridBorder" valign="top" >
                <asp:HiddenField ID="hfindex" runat="server" />
                <asp:GridView ID="gvMix" runat="server" AutoGenerateColumns="False" DataKeyNames="DetailID"
                    DataSourceID="dsAccInvDetails" SelectedIndex="0" Width="100%">
                    <RowStyle CssClass="GridRow1B" />
                    <SelectedRowStyle CssClass="SelectRow1T" />
                    <HeaderStyle CssClass="GridRow2B" />
                    <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                            ShowSelectButton="True">
                            <ItemStyle Width="25px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="DetText" HeaderText="Guest Name">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="Arrival"
                            HtmlEncode="False" SortExpression="CheckIn">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="Departure"
                            HtmlEncode="False" SortExpression="CheckOut">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BookingDate" DataFormatString="{0:d}" HeaderText="Bk.Date">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BookingVoucher" HeaderText="Voucher">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <%--<asp:BoundField DataField="FolioFull" HeaderText="Folio" SortExpression="FolioFull">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="DetailID" HeaderText="Reference" SortExpression="DetailID">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RoomTypeId" HeaderText="Room">
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MealPlanId" HeaderText="MP">
                            <ItemStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AdultNum" HeaderText="Ad">
                            <ItemStyle Width="25px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Chld1Num" HeaderText="Ch1">
                            <ItemStyle Width="25px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Chld2Num" HeaderText="Ch2">
                            <ItemStyle Width="25px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Chld3Num" HeaderText="Ch3">
                            <ItemStyle Width="25px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Chld4Num" HeaderText="Ch4">
                            <ItemStyle Width="25px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RoomsNum" HeaderText="Rms#">
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Amount" DataFormatString="{0:N2}" HeaderText="Amount"
                            SortExpression="Amount">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HAmount" DataFormatString="{0:N2}" HeaderText="HAmount"
                            SortExpression="HAmount" Visible="False">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PayAmount" DataFormatString="{0:N2}" HeaderText="Payed Am."
                            SortExpression="PayAmount">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Payed" HeaderText="Payed" SortExpression="Payed">
                            <ItemStyle Width="60px" />
                        </asp:CheckBoxField>
                    </Columns>
                    <EmptyDataTemplate>
                        There are no source invoice for this document.
                    </EmptyDataTemplate>
                </asp:GridView>
                <div class="Red" style="padding-left: 28px; margin-top: 2px;">
                    <asp:Panel ID="pnlDetail" runat="server">
                        <asp:GridView ID="gvStay" runat="server" AutoGenerateColumns="False"
                            DataSourceID="dsStayPay">
                            <RowStyle CssClass="GridRow1B" />
                            <HeaderStyle CssClass="SelectRow1TB" />
                            <Columns>
                                <asp:TemplateField HeaderText="InvoiceID" SortExpression="InvoiceID" 
                                    Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInvoiceID" runat="server" Text='<%# Bind("InvoiceID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label111" runat="server" Text='<%# Eval("InvoiceID") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DetailID" SortExpression="DetailID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSourceID" runat="server" Text='<%# Bind("DetailID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblSourceID" runat="server" Text='<%# Eval("DetailID") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AccDocId" SortExpression="AccDocId" 
                                    Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocumentID" runat="server" Text='<%# Bind("AccDocId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblDocID" runat="server" Text='<%# Eval("AccDocId") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TransID" SortExpression="TransID" 
                                    Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblTransID" runat="server" Text='<%# Eval("TransID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTransID" runat="server" Text='<%# Bind("TransID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Code" SortExpression="DocCode">
                                    <ItemTemplate>
                                        <asp:Label ID="Label31" runat="server" Text='<%# Eval("DocCode") %>'></asp:Label>
                                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("DocNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="DocDate" DataFormatString="{0:d}" HeaderText="Doc.Date"
                                    SortExpression="DocDate" ReadOnly="True">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Doc.Total" SortExpression="DocAmount">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" 
                                            Text='<%# Eval("DocAmount", "{0:N2}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DocAmount", "{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Applied" SortExpression="Amount">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblAppl" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount", "{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton3" runat="server" 
                                            CausesValidation="false" CommandName="Edit" ImageUrl="~/Images/right_one.png" 
                                            Text="Button" onclick="ImageButton3_Click" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTransfer" runat="server" CssClass="TextBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtTransfer" Display="None" ErrorMessage="Required Field!"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                            ControlToValidate="txtTransfer" Display="None" ErrorMessage="Double value!" 
                                            Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    </EditItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transfer Amount to">
                                    <EditItemTemplate>
                                    
                                       <asp:TextBox ID="txtDestID" runat="server" CssClass="TextBox" ReadOnly="True" 
                                            Width="49px" Visible="False" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="txtDestID" Display="None" ErrorMessage="Required Field!"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator11_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator11">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" 
                                            PopupControlID="gvDocToApply" Position="Center" TargetControlID="txtDestID">
                                        </asp:PopupControlExtender>
                                        <asp:TextBox ID="txtDest" runat="server" CssClass="TextBox" ReadOnly="True" 
                                            Width="333px" />
                                        <asp:PopupControlExtender ID="txtDest_PopupControlExtender" runat="server" 
                                            CommitProperty="Text" PopupControlID="gvDocToApply" Position="Center" 
                                            TargetControlID="txtDest">
                                        </asp:PopupControlExtender>
                                        <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" 
                                            BackColor="White" CssClass="GridBorder" DataKeyNames="DetailID,DetText,CheckIn,CheckOut" 
                                            DataSourceID="dsAccInvDetailsDest" GridLines="None" 
                                            OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged" ShowHeader="False" 
                                            Width="479px">
                                            <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                            <SelectedRowStyle CssClass="SelectRowClear" />
                                            <Columns>
                                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                                    ShowCancelButton="False" ShowSelectButton="True">
                                                <ItemStyle Width="20px" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="DetText" HeaderText="DetText" 
                                                    SortExpression="DetText">
                                                <ItemStyle Width="150px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" 
                                                    HeaderText="CheckIn" HtmlEncode="False" SortExpression="CheckIn">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" 
                                                    HeaderText="CheckOut" HtmlEncode="False" SortExpression="CheckOut">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="BookingVoucher" 
                                                    HeaderText="BookingVoucher" SortExpression="BookingVoucher">
                                                <ItemStyle Width="100px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="RoomTypeId" HeaderText="RoomTypeId" 
                                                    SortExpression="RoomTypeId"></asp:BoundField>
                                                <asp:BoundField DataField="MealPlanId" HeaderText="MealPlanId" 
                                                    SortExpression="MealPlanId"></asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                No documents to apply!
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                       
                                                                            
                                    </EditItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                            ImageUrl="~/Images/accept_inline.gif" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            ImageUrl="~/Images/decline_inline.gif" />
                                    </EditItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div style="padding-left: 129px; margin-top: 2px;">
                        </div>
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="dsAccInvDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccInvoiceTableAdapters.AccInvDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccInvDetailsDest" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy" 
        TypeName="dsAccInvoiceTableAdapters.AccInvDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="gvMix" Name="DetID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsStayPay" runat="server"
        SelectMethod="GetApplied" TypeName="dsAccInvoiceTableAdapters.InvStayPaymentTableAdapter"
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_InvoiceID" Type="Int32" />
            <asp:Parameter Name="Original_DetailID" Type="Int32" />
            <asp:Parameter Name="Original_AccDocId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="invDetail" Name="InvoiceID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="SourceID" Type="Int32" />
            <asp:Parameter Name="AccDocID" Type="Int32" />
            <asp:Parameter Name="TransID" Type="Int32" />
            <asp:Parameter Name="TrAmount" Type="Decimal" />
            <asp:Parameter Name="DestID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvMix" Name="DetailID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="invDetail" Name="InvoiceID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceID" Type="Int32" />
            <asp:Parameter Name="DetailID" Type="Int32" />
            <asp:Parameter Name="AccDocId" Type="Int32" />
            <asp:Parameter Name="TransID" Type="Int32" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsStayDetail" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccInvoiceTableAdapters.InvStayDetailTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvMix" Name="DetailID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="invDetail" Name="InvoiceID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:HiddenField ID="dummy" runat="server" />
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
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <%--<asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;--%>
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>


    </div>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
