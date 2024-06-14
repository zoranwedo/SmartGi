<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="InvoiceHotel.aspx.vb" 
    Inherits="Invoices_InvoiceHotel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Invoice Change Hotel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div id="InvDet" class="Blue" >
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/Invoices.aspx" Text="&lt;&lt; Back to Invoices" Enabled="false" />
                </td>
                <td class="LocalMenuRow">&nbsp;</td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%"
                                DataSourceID="dsInvoice" DataKeyNames="HotelId" >
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfState" runat="server" Value='<%# Eval("State") %>' />
                                    <asp:HiddenField ID="fhCCIReview" runat="server" Value='<%# Eval("CCIReview") %>' />
                                    <asp:HiddenField ID="fhAppAmount" runat="server" Value='<%# Eval("AppAmount") %>' />
                                    <asp:HiddenField ID="hfDeliveryDate" runat="server" Value='<%# Eval("DeliveryDate") %>' />
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td class="GridLabelBG" colspan="6">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "Invoice No&nbsp;<h6>" & Eval("InvNumber") & "</h6>" %>' />
                                                <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" Text='<%# Eval("InvTypeDisp") %>'
                                                    Visible='<%# iif(Eval("InvType") >1,True,False) %>' />
                                                <asp:Label ID="Label8" runat="server" SkinID="skGridLabel" Text='<%# "For Group:&nbsp;<h6>" & Eval("ResGroup") & "</h6>" %>'
                                                    Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="3">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Hotel</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                (<asp:Label ID="Label2" runat="server" Text='<%# Eval("HotelId") %>' />)
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                            </td>
                                            <td style="width: 10px;" rowspan="3">&nbsp;</td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" >
                                                <asp:Button ID="btnPrint" runat="server" CommandName="Print" SkinID="skBtnBase" Text="Print Invoice"
                                                    Width="100px" Enabled="false" />
                                            </td>
                                            <td rowspan="3">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Tour Operator</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                (<asp:Label ID="Label25" runat="server" Text='<%# Eval("TourOpId") %>' />)
                                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("BillingName") %>' />
                                                (<asp:Label ID="Label27" runat="server" Text='<%# Eval("TourOp") %>' />)
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" >
                                                <asp:Button ID="btnExcel" runat="server" CommandName="XLSExport" SkinID="skBtnBase" Text="Export to Excel"
                                                    Width="100px" Enabled="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Travel</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                <asp:Label ID="Label4" runat="server" Text="-" style="width: 50px; text-align:center;" />
                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                <asp:Label ID="Label17" runat="server" Text='<%# "(" & Eval("Nights") & " Nights)" %>' style="width: 100px; text-align:left;" />
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" >
                                                <asp:Button ID="btnXML" runat="server" CommandName="XMLExport" SkinID="skBtnBase" Text="Export to XML"
                                                    Width="100px" Enabled="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate >
                                    <div class="GridLabelBG" style="width: 100%;" >
                                        <asp:Label ID="Label30" runat="server" SkinID="skGridLabel">
                                            <h6>Sorry, no such invoice!</h6>
                                        </asp:Label>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:FormView ID="fvInvoice" runat="server" Width="100%"
                                DataSourceID="dsInvoice" DataKeyNames="InvoiceID">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Amount</b></td>
                                            <td style="width: 450px;" class="GridRow1B">
                                                <asp:Label ID="lblAmount0" runat="server" Width="100px" 
                                                    Text='<%# Iif(IsHotelView, Eval("HAmount", "{0:N2}"), Eval("Amount", "{0:N2}")) %>' />
                                                <i>
                                                <asp:Label ID="BalanceLabel" runat="server" Width="300px" 
                                                    Visible='<%# Not IsHotelView AND IsAccounted %>'
                                                    Text='<%# "(Balance: " & Eval("Balance", "{0:N}") & "  On: " & Eval("BalanceDate", "{0:d}") & "  Applied: " & Eval("AppAmount", "{0:N}") & ")" %>' />
                                                </i>
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" class="GridRow1B">
                                                <div class="Red">
                                                <asp:Button ID="btRecalc" runat="server" CommandName="Recalc" SkinID="skBtnBase"
                                                    Text="Recalculate" Width="100px" Visible="false"
                                                    OnClientClick="return confirm('Are you sure you want to recalculate whole invoice?')" />
                                                </div>
                                            </td>
                                            <td rowspan="7" style="width: 10px;">&nbsp;</td>
                                            <td rowspan="7" style="width: 120px; text-align: center; padding: 3px; vertical-align: top;" >
                                                <div class="Red">
                                                    <table class="GridBorderThin" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                        <tr>
                                                            <td style="width: 120px; height: 40px; text-align: center; vertical-align: middle; border-bottom: solid 1px;">
                                                                <b>
                                                                    <asp:Label ID="Label41" runat="server" Style="padding: 2px;"
                                                                        Text='<%# Eval("InvoiceState") %>' Visible='<%# Eval("State") >= 0 %>'
                                                                        ToolTip='<%# Eval("State") %>' />
                                                                    <asp:Label ID="Label33" runat="server" ForeColor="Red" Text='<%# iif(Eval("State") = -3, "Canceled by Hotel","Canceled by CCI") %>'
                                                                        Visible='<%# Eval("State") = -3 OR Eval("State") = -7 %>' />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:CheckBox ID="cbRVHtl" runat="server" Text="Htl Reviewed" Checked='<%# Eval("State")=2 %>' 
                                                                    Visible='<%# IsHotelState AND IsHotelUser %>' Enabled="false" />
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:HyperLink ID="hlSend" runat="server" NavigateUrl="~/Invoices/InvoiceSend.aspx"
                                                                    Visible='<%# Eval("State")=2 AND IsHotelUser %>' Enabled="false" >
                                                                    Sending List &gt;&gt;
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:LinkButton ID="cbRVCci" runat="server" Font-Underline="False"
                                                                    Visible='<%# IsCCIState %>' Enabled="false" > 
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cbChecked.png" Visible='<%# Eval("CCIReview") %>' />
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cbUnchecked.png" Visible='<%# Not Eval("CCIReview") %>' />
                                                                    CCI Reviewed
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td rowspan="7">&nbsp;</td>
                                            
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Invoice Date</b></td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("InvDate", "{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Reference</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvRefText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Note</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("InvPrnText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Comment</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("InvComment") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRowClear">Delivery Date</td>
                                            <td style="width: 450px; vertical-align: middle;" class="GridRowClear">
                                                <asp:Label ID="Label47" runat="server" Text='<%# Eval("DeliveryDate","{0:d}") %>' 
                                                    Visible='<%# NOT IsCCIReviewed OR IsDelivered OR IsHotelView OR Eval("State")<3 %>' />
                                                <asp:TextBox ID="txtDelivery" runat="server" CssClass="TextBox" Enabled="false"
                                                    Text='<%# Bind("DeliveryDate","{0:d}") %>'
                                                    Visible='<%# IsCCIReviewed AND NOT IsDelivered AND NOT IsHotelView AND (Eval("State")=5 OR Eval("State")=6) %>' />
                                                <asp:CalendarExtender ID="txtDelivery_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                    Enabled="True" TargetControlID="txtDelivery" />
                                                <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtDelivery"
                                                    Display="None" ErrorMessage="Date field!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="CompareValidator7" />
                                            </td>
                                            <td style="width: 120px; text-align: right; padding: 3px 0px 3px 0px;" class="GridRowClear">
                                                <asp:Button ID="btnUnDeliv" runat="server" SkinID="skBtnBase" Text="Reset Delivery" Width="100px" 
                                                    Enabled="false" Visible='<%# IsCCIUser AND IsDelivered AND NOT IsHotelView %>' />
                                                <asp:Button ID="btnDeliv" runat="server" SkinID="skBtnBase" Text="Set Delivery" Width="100px" 
                                                    Enabled="false" Visible='<%# IsCCIUser AND IsCCIReviewed AND NOT IsDelivered AND NOT IsHotelView AND (Eval("State")=5 OR Eval("State")=6) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;" colspan="2">
                                                <div class="Red">
                                                    <asp:Button ID="btnCancel" runat="server" CommandName="CancelInv" SkinID="skBtnBase"
                                                        Visible='<%# (IsHotelState AND IsHotelUser) OR (IsCCIState AND IsCCIUser AND NOT IsHotelView) %>'
                                                        Text="Cancel" Width="100px" Enabled="false" />
                                                </div>
                                            </td>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                                <asp:Button ID="btnUpdate" runat="server" CommandName="Edit" SkinID="skBtnBase" Text="Edit"
                                                    Visible='<%# IsUserInState %>' Enabled="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="UpdatePanelDetail" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="0" >
                            <tr>
                                <td class="GridLabelBG">
                                    <asp:Label ID="Label31" runat="server" Text="Change Hotel" CssClass="GridLabel" Height="26px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridBorder" style="vertical-align: top;">
                                    <asp:Panel ID="pnlEmpty" runat="server" Visible="false" >
                                        <table cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td style="width: 900px;" >
                                                    There are no alternative hotels. Please cancel this operation.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="border: none; text-align: right; padding-top: 5px;" >
                                                    <asp:Button ID="btHotelCancel0" runat="server" Text="Cancel" SkinID="skBtnBase" 
                                                        onclick="btHotelCancel_Click" />&nbsp;
                                                </td> 
                                            </tr>
                                        </table> 
                                    </asp:Panel>

                                    <asp:Panel ID="pnlHotels" runat="server" >
                                        <table cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td style="width: 100px;" >&nbsp;</td>
                                                <td style="width: 400px; text-align: center; font-weight: bold;">Source</td>
                                                <td style="width: 400px; text-align: center; font-weight: bold;">Destination</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px;" >Hotel</td>
                                                <td style="width: 400px; border-left: solid 1px; border-top: solid 1px; border-bottom: solid 1px; padding-left: 2px;" >
                                                    <asp:Label ID="sHotelLabel1" runat="server" Text="Source Hotel" />
                                                </td>
                                                <td style="width: 400px; border: solid 1px; padding-left: 2px;" >
                                                    <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="border: none; text-align: right; padding-top: 5px;" >
                                                    <asp:Button ID="btHotelCancel1" runat="server" Text="Cancel" SkinID="skBtnBase" 
                                                        onclick="btHotelCancel_Click" />&nbsp;
                                                    <asp:Button ID="btHotelSet" runat="server" Text="Next" SkinID="skBtnBase" 
                                                        onclick="btHotelSet_Click" />
                                                </td> 
                                            </tr>
                                        </table> 
                                    </asp:Panel>

                                    <asp:Panel ID="pnlRooms" runat="server" Visible="false">
                                        <table cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td style="width: 100px;" >&nbsp;</td>
                                                <td style="width: 400px; text-align: center; font-weight: bold;">Source</td>
                                                <td style="width: 400px; text-align: center; font-weight: bold;">Destination</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px;" >Hotel</td>
                                                <td style="width: 400px; border-left: solid 1px; border-top: solid 1px; border-bottom: solid 1px; padding-left: 2px;" >
                                                    <asp:Label ID="sHotelLabel2" runat="server" />
                                                </td>
                                                <td style="width: 400px; border: solid 1px; padding-left: 2px;" >
                                                    <asp:HiddenField ID="dHotelID" runat="server" />
                                                    <asp:Label ID="dHotelLabel" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Room Type</td>
                                                <td colspan="2" style="padding-top: 1px; border-collapse: collapse;">
                                                    <asp:GridView ID="gvRooms" runat="server" AutoGenerateColumns="False" 
                                                        DataKeyNames="InvoiceID" DataSourceID="dsRooms" ShowHeader="False">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="RoomType" SortExpression="RoomType">
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="sRoomID" runat="server" Value='<%# Bind("RoomTypeId") %>' />
                                                                    <asp:Label ID="lblRoom" runat="server" Text='<%# Bind("Room") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="400px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlSelectRoom" runat="server" CssClass="TextBox" 
                                                                        DataSourceID="dsSelectRoom" DataTextField="Room" DataValueField="RoomTypeID" />
                                                                    <asp:ObjectDataSource ID="dsSelectRoom" runat="server" 
                                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                                        TypeName="dsInvoiceFormTableAdapters.InvChDestRoomTypeTableAdapter">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="ddlHotels" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:ObjectDataSource>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="400px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataTemplate>No rows!</EmptyDataTemplate>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="border: none; text-align: right; padding-top: 5px; padding-bottom: 5px;" >
                                                    <asp:Button ID="btHotelCancel2" runat="server" Text="Cancel" SkinID="skBtnBase" 
                                                        onclick="btHotelCancel_Click" />&nbsp;
                                                    <asp:Button ID="btHotelBack" runat="server" Text="Back" SkinID="skBtnBase" 
                                                        onclick="btHotelBack_Click" />&nbsp;
                                                    <asp:Button ID="btHotelFinish" runat="server" Text="Finish" SkinID="skBtnBase" 
                                                        onclick="btHotelFinish_Click" />
                                                </td> 
                                            </tr>
                                        </table> 
                                    </asp:Panel>
                                    <asp:ObjectDataSource ID="dsRooms" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsInvoiceFormTableAdapters.InvChRoomTypeTableAdapter">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="dummy" runat="server" />
                        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
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
                                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                                        </p>
                                        <p style="text-align: right;" class="GridRow1T"><br />
                                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:ObjectDataSource ID="dsInvoice" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.InvoiceHeadTableAdapter"
                    SelectMethod="GetDataByID"
                    UpdateMethod="UpdateQuery">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="InvDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvRefText" Type="String" />
                        <asp:Parameter Name="InvPrnText" Type="String" />
                        <asp:Parameter Name="InvComment" Type="String" />
                        <asp:ControlParameter ControlID="hfUsername" Name="EditUser" PropertyName="Value" Type="String" />
                        <asp:Parameter Name="EditDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvBalance" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.InvAccBalanceTableAdapter"
                    SelectMethod="GetDataByID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
