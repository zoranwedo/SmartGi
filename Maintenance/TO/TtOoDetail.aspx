<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/TO/TOMaster.master" AutoEventWireup="false" 
    CodeFile="TtOoDetail.aspx.vb" Inherits="Maintenance_TO_TtOoDetail" 
    MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TOTitle" Runat="Server">
    Tour Operator Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TOContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridBorder" style="padding-left: 6px; padding-right: 6px;">
                    <asp:UpdatePanel ID="upTTOO" runat="server">
                    <ContentTemplate>
                    <asp:FormView ID="fvTourOp" runat="server" DataKeyNames="TourOpID" 
                        DataSourceID="dsTourOp1">
                        <EditItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="txtTourOp" runat="server" CssClass="TextBox" style="font-size: larger;"
                                            Text='<%# Bind("TourOp") %>' />
                                        <asp:RequiredFieldValidator ID="reqTO" runat="server"  Display="None"
                                            ControlToValidate="txtTourOp" ErrorMessage="This is required field!" />
                                        <asp:ValidatorCalloutExtender ID="reqTOExt" runat="server" 
                                            TargetControlID="reqTO" HighlightCssClass="WaterMark" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="width: 20px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px; width: 110px;">TourOpID</td>
                                    <td class="GridRow1B" style="padding: 2px; width: 480px;">
                                        <asp:Label ID="lblTourOpID" runat="server" 
                                            Text='<%# Eval("TourOpID") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >RNC</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="RNCTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("RNC") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Parent TourOp.</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlParentTourOp" runat="server" CssClass="TextBox" Width="350px"
                                            DataSourceID="dsParentTourOp" DataTextField="TourOp" DataValueField="TourOpID" 
                                            SelectedValue='<%# Bind("ParentTourOpId") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                        <asp:CheckBox ID="BillingParentCheckBox" runat="server" Text="Bill to Parent" 
                                            Checked='<%# Bind("BillingParent") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Market</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsMarket" DataTextField="MarketDisplay" DataValueField="MarketID" 
                                            SelectedValue='<%# Bind("MarketId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Active</td>
                                    <td class="GridRow1B" >
                                        <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                            Checked='<%# Bind("Active") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Created</td>
                                    <td class="GridRow1B" >
                                        <asp:Label ID="lblCreated" runat="server" 
                                            Text='<%# Bind("Created", "{0:d}") %>' />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Billing</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Billing Name</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="txtBillingName" runat="server" CssClass="TextBox"
                                            Text='<%# Bind("BillingName") %>' />
                                        <asp:RequiredFieldValidator ID="reqBillingName" runat="server"  Display="None"
                                            ControlToValidate="txtBillingName" ErrorMessage="This is required field!" />
                                        <asp:ValidatorCalloutExtender ID="extBillingName" runat="server" 
                                            TargetControlID="reqBillingName" HighlightCssClass="WaterMark" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Commision</td>
                                    <td class="GridRow1B" >
                                        <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Applies" 
                                            Checked='<%# Bind("Commision") %>' />
                                        <asp:TextBox ID="txtCommisionRate" runat="server" CssClass="TextBox" Width="150px" 
                                            Text='<%# Bind("CommisionRate") %>' />%
                                        <asp:CompareValidator ID="numCommisionRate" runat="server" 
                                            ControlToValidate="txtCommisionRate" Type="Double" Display="None"
                                            ErrorMessage="Please input a valid number" Operator="DataTypeCheck"/>
                                        <asp:ValidatorCalloutExtender ID="extCommisionRate" runat="server"
                                            Enabled="True" TargetControlID="numCommisionRate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Person</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="BillingPersonTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("BillingPerson") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >e-mail</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="BillingMailTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("BillingMail") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Send Invoice via</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlDeliveryChannelId" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsDeliveryChannel" DataTextField="SendChannel" DataValueField="SendChannelID" 
                                            SelectedValue='<%# Bind("DeliveryChannelId") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Billing Doc.</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlBillDoc" runat="server" CssClass="TextBox"
                                            SelectedValue='<%# Bind("BillingDoc") %>'>
                                            <asp:ListItem Text="Final Invoice - Individual" Value="FT"/>
                                            <asp:ListItem Text="Final Invoice - Group" Value="FT-GR"/>
                                            <asp:ListItem Text="Proforma - Individual" Value="PF"/>
                                            <asp:ListItem Text="Proforma - Group" Value="PF-GR"/>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Delivery</td>
                                    <td class="GridRow1B" >
                                        <asp:CheckBox ID="cbDeliveryBy" runat="server" Text="By Checkout" 
                                            Checked='<%# Bind("DeliveryByCheckout") %>' />
                                        <asp:CheckBox ID="cbGross" runat="server"  Text="Gross Billing"
                                            Checked='<%# Bind("GrossBilling")%>' style="padding-left: 15px;"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Address</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Address</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >City</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="CityTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("City") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >ZipCode</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("ZipCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >State</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="StateTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("State") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Country</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlCountryCode" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsCountryCode" DataTextField="CountryDisplay" DataValueField="CountryCode" 
                                            SelectedValue='<%# Bind("CountryCode") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Contact</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >URL</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="URLTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("URL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel1</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel1TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel1") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel2</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel2TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel2") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel3</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel3TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel3") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Fax</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="FaxTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Fax") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Email1</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:TextBox ID="Email1TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Email1") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Email2</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Email2TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Email2") %>' />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Payment</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Mode</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayModeId" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsPayMode" DataTextField="PayModeDisplay" DataValueField="PayModeId" 
                                            SelectedValue='<%# Bind("PayModeId") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Cond</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayCondId" runat="server" CssClass="TextBox" 
                                            AutoPostBack="true" ontextchanged="ddlPayCondId_TextChanged"/>                                    
                                        <asp:CascadingDropDown ID="exPayCond" runat="server" 
                                            TargetControlID="ddlPayCondId" 
                                            Category="PayCondId" 
                                            ServicePath="~/TourOpPayment.asmx"
                                            ServiceMethod="GetPayCondId"
                                            SelectedValue='<%# Eval("PayCondId")%>' >
                                        </asp:CascadingDropDown>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Cond Ext.</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayCondExtId" runat="server" CssClass="TextBox" />
                                        <asp:CascadingDropDown ID="exPayCondExt" runat="server" 
                                            TargetControlID="ddlPayCondExtId" 
                                            ParentControlID="ddlPayCondId"
                                            Category="PayCondExtId" 
                                            ServicePath="~/TourOpPayment.asmx"
                                            ServiceMethod="GetPayCondExtId" 
                                            SelectedValue='<%# Eval("PayCondExtId")%>' >
                                        </asp:CascadingDropDown>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >
                                        <asp:Label ID="lblPayDays" runat="server" Text='<%#DaysLabel(Eval("PayCondId"))%>' />
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="txtCreditDays" runat="server" CssClass="TextBox" Width="150px" Text='<%# Bind("CreditDays") %>' />
                                        <asp:CompareValidator ID="numCreditDays" runat="server" 
                                            ControlToValidate="txtCreditDays" Type="Integer" Display="None"
                                            ErrorMessage="Please input a valid number" Operator="DataTypeCheck"/>
                                        <asp:ValidatorCalloutExtender ID="extCreditDays" runat="server"
                                            Enabled="True" TargetControlID="numCreditDays" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Note</b>
                                        <asp:TextBox ID="NoteTextBox" runat="server" CssClass="TextBox" TextMode="MultiLine"
                                            Text='<%# Bind("Note") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: right; padding-top: 8px; padding-bottom: 6px;" colspan="3">
                                    <asp:Button ID="btUpdate" runat="server" SkinID="skBtnBase" CausesValidation="True" CommandName="Update" Text="Update" />&nbsp;
                                    <asp:Button ID="btCancel" runat="server" SkinID="skBtnBase" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" colspan="2">
                                        <b>Tour Operater</b>
                                    </td>
                                    <td class="GridRow1B" colspan="1">
                                        <asp:TextBox ID="txtTourOp" runat="server" CssClass="TextBox" style="font-size: larger;"
                                            Text='<%# Bind("TourOp") %>' />
                                        <asp:RequiredFieldValidator ID="reqTO" runat="server"  Display="None"
                                            ControlToValidate="txtTourOp" ErrorMessage="This is required field!" />
                                        <asp:ValidatorCalloutExtender ID="reqTOExt" runat="server" 
                                            TargetControlID="reqTO" HighlightCssClass="WaterMark" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="width: 20px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="width: 110px;">RNC</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:TextBox ID="RNCTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("RNC") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">&nbsp;</td>
                                    <td class="SelectRow1B">Parent TourOp.</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlParentTourOp" runat="server" CssClass="TextBox" Width="350px"
                                            DataSourceID="dsParentTourOp" DataTextField="TourOp" DataValueField="TourOpID" 
                                            SelectedValue='<%# Bind("ParentTourOpId") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                        <asp:CheckBox ID="BillingParentCheckBox" runat="server" Text="Bill to Parent" 
                                            Checked='<%# Bind("BillingParent") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">&nbsp;</td>
                                    <td class="SelectRow1B">Market</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsMarket" DataTextField="MarketDisplay" DataValueField="MarketID" 
                                            SelectedValue='<%# Bind("MarketId") %>' />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Billing</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Billing Name</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="txtBillingName" runat="server" CssClass="TextBox"
                                            Text='<%# Bind("BillingName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Commision</td>
                                    <td class="GridRow1B" >
                                        <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Applies" 
                                            Checked='<%# Bind("Commision") %>' />
                                        <asp:TextBox ID="txtCommisionRate" runat="server" CssClass="TextBox" Width="150px" 
                                            Text='<%# Bind("CommisionRate") %>' />%
                                        <asp:CompareValidator ID="numCommisionRate" runat="server" 
                                            ControlToValidate="txtCommisionRate" Type="Double" Display="None"
                                            ErrorMessage="Please input a valid number" Operator="DataTypeCheck"/>
                                        <asp:ValidatorCalloutExtender ID="extCommisionRate" runat="server"
                                            Enabled="True" TargetControlID="numCommisionRate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Person</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="BillingPersonTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("BillingPerson") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >e-mail</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="BillingMailTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("BillingMail") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Send Invoice via</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlDeliveryChannelId" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsDeliveryChannel" DataTextField="SendChannel" DataValueField="SendChannelID" 
                                            SelectedValue='<%# Bind("DeliveryChannelId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Billing Doc.</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlBillDoc" runat="server" CssClass="TextBox"
                                            SelectedValue='<%# Bind("BillingDoc") %>'>
                                            <asp:ListItem Text="Final Invoice - Individual" Value="FT"/>
                                            <asp:ListItem Text="Final Invoice - Group" Value="FT-GR"/>
                                            <asp:ListItem Text="Proforma - Individual" Value="PF"/>
                                            <asp:ListItem Text="Proforma - Group" Value="PF-GR"/>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Delivery</td>
                                    <td class="GridRow1B" >
                                        <asp:CheckBox ID="cbDeliveryBy" runat="server" Text="By Checkout" 
                                            Checked='<%# Bind("DeliveryByCheckout") %>' />
                                        <asp:CheckBox ID="cbGross" runat="server"  Text="Gross Billing"
                                            Checked='<%# Bind("GrossBilling")%>' style="padding-left: 15px;"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Address</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Address</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >City</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="CityTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("City") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >ZipCode</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("ZipCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >State</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="StateTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("State") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Country</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlCountryCode" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsCountryCode" DataTextField="CountryDisplay" DataValueField="CountryCode" 
                                            SelectedValue='<%# Bind("CountryCode") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Contact</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >URL</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="URLTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("URL") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel1</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel1TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel1") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel2</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel2TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel2") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Tel3</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Tel3TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Tel3") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Fax</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="FaxTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Fax") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Email1</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:TextBox ID="Email1TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Email1") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Email2</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="Email2TextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Email2") %>' />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Payment</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Mode</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayModeId" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsPayMode" DataTextField="PayModeDisplay" DataValueField="PayModeId" 
                                            SelectedValue='<%# Bind("PayModeId") %>' AppendDataBoundItems="true" >
                                            <asp:ListItem Text="not set" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Cond</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayCondId" runat="server" CssClass="TextBox" 
                                            AutoPostBack="true" ontextchanged="ddlPayCondId_TextChanged"/>                                   
                                        <asp:CascadingDropDown ID="exPayCond" runat="server" 
                                            TargetControlID="ddlPayCondId" 
                                            Category="PayCondId" 
                                            ServicePath="~/TourOpPayment.asmx"
                                            ServiceMethod="GetPayCondId"
                                            SelectedValue='<%# Eval("PayCondId")%>' >
                                        </asp:CascadingDropDown>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Pay Cond Ext.</td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlPayCondExtId" runat="server" CssClass="TextBox" />                                    
                                        <asp:CascadingDropDown ID="exPayCondExt" runat="server" 
                                            TargetControlID="ddlPayCondExtId" 
                                            ParentControlID="ddlPayCondId"
                                            Category="PayCondExtId" 
                                            ServicePath="~/TourOpPayment.asmx"
                                            ServiceMethod="GetPayCondExtId" 
                                            SelectedValue='<%# Eval("PayCondExtId")%>' >
                                        </asp:CascadingDropDown>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >
                                        <asp:Label ID="lblPayDays" runat="server" Text='<%#DaysLabel(Eval("PayCondId"))%>' />
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="txtCreditDays" runat="server" CssClass="TextBox" Width="150px" Text='<%# Bind("CreditDays") %>' />
                                        <asp:CompareValidator ID="numCreditDays" runat="server" 
                                            ControlToValidate="txtCreditDays" Type="Integer" Display="None"
                                            ErrorMessage="Please input a valid number" Operator="DataTypeCheck"/>
                                        <asp:ValidatorCalloutExtender ID="extCreditDays" runat="server"
                                            Enabled="True" TargetControlID="numCreditDays" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Note</b>
                                        <asp:TextBox ID="NoteTextBox" runat="server" CssClass="TextBox" TextMode="MultiLine"
                                            Text='<%# Bind("Note") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: right; padding-top: 8px; padding-bottom: 6px;" colspan="3">
                                    <asp:Button ID="btInsert" runat="server" SkinID="skBtnBase" CausesValidation="True" CommandName="Insert" Text="Add" />&nbsp;
                                    <asp:Button ID="btCancel" runat="server" SkinID="skBtnBase" CausesValidation="False" CommandName="Back" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="padding: 2px; font-size: larger;" colspan="3">
                                        <b><%# Eval("TourOp") %></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px; width: 20px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px; width: 110px;">TourOpID</td>
                                    <td class="GridRow1B" style="padding: 2px; width: 480px;"><%# Eval("TourOpID") %></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">RNC</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("RNC")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Parent TourOp.</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <%#Eval("ParentTourOp")%>
                                        <asp:CheckBox ID="BillingParentCheckBox" runat="server" Enabled="false" Text="Bill to Parent"
                                            Checked='<%# Eval("BillingParent") %>'
                                            Visible='<%# Eval("ParentTourOp") IsNot DBNull.Value %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Market</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Market")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Active</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Created</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Created", "{0:d}")%></td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Billing</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Billing Name</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("BillingName")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Commision</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Applies" Checked='<%# Eval("Commision") %>' 
                                            Enabled="false" Text='<%# Eval("CommisionRate","{0}%") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Person</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("BillingPerson")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">e-mail</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("BillingMail")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Send Invoice via</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("DeliveryChannel")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" >&nbsp;</td>
                                    <td class="SelectRow1B" >Billing Doc.</td>
                                    <td class="GridRow1B" >
                                        <%#DocumentLabel(Eval("BillingDoc"))%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Delivery</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <asp:CheckBox ID="cbDeliveryBy" runat="server" Checked='<%# Eval("DeliveryByCheckout") %>' 
                                            Enabled="false" Text="By Checkout"/>
                                        <asp:CheckBox ID="cbGross" runat="server" Checked='<%# Eval("GrossBilling")%>' 
                                            Enabled="false" Text="Gross Billing" style="padding-left: 15px;"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Address</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Address</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%# Eval("Address") %></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">City</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("City")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">ZipCode</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("ZipCode")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">State</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("State")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Country</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <%#Eval("CountryCode", "({0:d})")%> <%#Eval("Country")%>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Contact</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">URL</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("URL")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Tel1</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Tel1")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Tel2</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Tel2")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Tel3</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Tel3")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Fax</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Fax")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Email1</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Email1")%></td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Email2</td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("Email2")%></td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Payment</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Pay Mode</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <%#Eval("PayModeId", "({0:d})")%> <%#Eval("PayMode")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Pay Cond</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <%#Eval("PayCondId", "({0:d})")%> <%#Eval("PayCond")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;">Pay Cond Ext.</td>
                                    <td class="GridRow1B" style="padding: 2px;">
                                        <%#Eval("PayCondExtId", "({0:d})")%> <%#Eval("PayCondExt")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="padding: 2px;">&nbsp;</td>
                                    <td class="SelectRow1B" style="padding: 2px;"><%#DaysLabel(Eval("PayCondId"))%></td>
                                    <td class="GridRow1B" style="padding: 2px;"><%#Eval("CreditDays")%></td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="padding: 4px 2px 0px 10px;" colspan="3">
                                        <b>Note</b><br />
                                        <%# Eval("Note") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: right; padding-top: 8px; padding-bottom: 6px;" colspan="3">
                                    <asp:Button ID="btEdit" runat="server" SkinID="skBtnBase" CausesValidation="False" CommandName="Edit" Text="Edit" />&nbsp;
                                    <asp:Button ID="btNew" runat="server" SkinID="skBtnBase" CausesValidation="False" CommandName="Add" Text="New" />&nbsp;
                                    <asp:Button ID="btDelete" runat="server" SkinID="skBtnBase" CausesValidation="False" CommandName="Delete" Text="Delete" 
                                        OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <uc:MessagePop ID="msgPop" runat="server" Title="Tour Operator" />

                    <asp:ObjectDataSource ID="dsTourOp" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByID" 
                        TypeName="dsTourOperatorTableAdapters.TourOpTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
                            <asp:Parameter Name="TourOp" Type="String" />
                            <asp:Parameter Name="BillingName" Type="String" />
                            <asp:Parameter Name="RNC" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZipCode" Type="String" />
                            <asp:Parameter Name="Country" Type="String" />
                            <asp:Parameter Name="Tel1" Type="String" />
                            <asp:Parameter Name="Tel2" Type="String" />
                            <asp:Parameter Name="Tel3" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="URL" Type="String" />
                            <asp:Parameter Name="Email1" Type="String" />
                            <asp:Parameter Name="Email2" Type="String" />
                            <asp:Parameter Name="PayModeId" Type="String" />
                            <asp:Parameter Name="PayCondId" Type="String" />
                            <asp:Parameter Name="PayCondExtId" Type="Int32" />
                            <asp:Parameter Name="CreditDays" Type="Int32" />
                            <asp:Parameter Name="BillingParent" Type="Boolean" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Note" Type="String" />
                            <asp:Parameter Name="Created" Type="DateTime" />
                            <asp:Parameter Name="CountryCode" Type="String" />
                            <asp:Parameter Name="Commision" Type="Boolean" />
                            <asp:Parameter Name="CommisionRate" Type="Decimal" />
                            <asp:Parameter Name="BillingPerson" Type="String" />
                            <asp:Parameter Name="BillingMail" Type="String" />
                            <asp:Parameter Name="DeliveryChannelId" Type="Int32" />
                            <asp:Parameter Name="DeliveryByCheckout" Type="Boolean" />
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TourOpID" QueryStringField="TOID" 
                                Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
                            <asp:Parameter Name="TourOp" Type="String" />
                            <asp:Parameter Name="BillingName" Type="String" />
                            <asp:Parameter Name="RNC" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZipCode" Type="String" />
                            <asp:Parameter Name="Country" Type="String" />
                            <asp:Parameter Name="Tel1" Type="String" />
                            <asp:Parameter Name="Tel2" Type="String" />
                            <asp:Parameter Name="Tel3" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="URL" Type="String" />
                            <asp:Parameter Name="Email1" Type="String" />
                            <asp:Parameter Name="Email2" Type="String" />
                            <asp:Parameter Name="PayModeId" Type="String" />
                            <asp:Parameter Name="PayCondId" Type="String" />
                            <asp:Parameter Name="PayCondExtId" Type="Int32" />
                            <asp:Parameter Name="CreditDays" Type="Int32" />
                            <asp:Parameter Name="BillingParent" Type="Boolean" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Note" Type="String" />
                            <asp:Parameter Name="Created" Type="DateTime" />
                            <asp:Parameter Name="CountryCode" Type="String" />
                            <asp:Parameter Name="Commision" Type="Boolean" />
                            <asp:Parameter Name="CommisionRate" Type="Decimal" />
                            <asp:Parameter Name="BillingPerson" Type="String" />
                            <asp:Parameter Name="BillingMail" Type="String" />
                            <asp:Parameter Name="DeliveryChannelId" Type="Int32" />
                            <asp:Parameter Name="DeliveryByCheckout" Type="Boolean" />
                            <asp:Parameter Direction="Output" Name="NewID" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>

                    <asp:ObjectDataSource ID="dsTourOp1" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByID" 
                        TypeName="dsTourOperatorTableAdapters.TourOp1TableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
                            <asp:Parameter Name="TourOp" Type="String" />
                            <asp:Parameter Name="BillingName" Type="String" />
                            <asp:Parameter Name="RNC" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZipCode" Type="String" />
                            <asp:Parameter Name="Country" Type="String" />
                            <asp:Parameter Name="Tel1" Type="String" />
                            <asp:Parameter Name="Tel2" Type="String" />
                            <asp:Parameter Name="Tel3" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="URL" Type="String" />
                            <asp:Parameter Name="Email1" Type="String" />
                            <asp:Parameter Name="Email2" Type="String" />
                            <asp:Parameter Name="PayModeId" Type="String" />
                            <asp:Parameter Name="PayCondId" Type="String" />
                            <asp:Parameter Name="PayCondExtId" Type="Int32" />
                            <asp:Parameter Name="CreditDays" Type="Int32" />
                            <asp:Parameter Name="BillingParent" Type="Boolean" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Note" Type="String" />
                            <asp:Parameter Name="Created" Type="DateTime" />
                            <asp:Parameter Name="CountryCode" Type="String" />
                            <asp:Parameter Name="Commision" Type="Boolean" />
                            <asp:Parameter Name="CommisionRate" Type="Decimal" />
                            <asp:Parameter Name="BillingPerson" Type="String" />
                            <asp:Parameter Name="BillingMail" Type="String" />
                            <asp:Parameter Name="DeliveryChannelId" Type="Int32" />
                            <asp:Parameter Name="DeliveryByCheckout" Type="Boolean" />
                            <asp:Parameter Name="GrossBilling" Type="Boolean" />
                            <asp:Parameter Name="BillingDoc" Type="String" />
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TourOpID" QueryStringField="TOID" 
                                Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
                            <asp:Parameter Name="TourOp" Type="String" />
                            <asp:Parameter Name="BillingName" Type="String" />
                            <asp:Parameter Name="RNC" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZipCode" Type="String" />
                            <asp:Parameter Name="Country" Type="String" />
                            <asp:Parameter Name="Tel1" Type="String" />
                            <asp:Parameter Name="Tel2" Type="String" />
                            <asp:Parameter Name="Tel3" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="URL" Type="String" />
                            <asp:Parameter Name="Email1" Type="String" />
                            <asp:Parameter Name="Email2" Type="String" />
                            <asp:Parameter Name="PayModeId" Type="String" />
                            <asp:Parameter Name="PayCondId" Type="String" />
                            <asp:Parameter Name="PayCondExtId" Type="Int32" />
                            <asp:Parameter Name="CreditDays" Type="Int32" />
                            <asp:Parameter Name="BillingParent" Type="Boolean" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Note" Type="String" />
                            <asp:Parameter Name="Created" Type="DateTime" />
                            <asp:Parameter Name="CountryCode" Type="String" />
                            <asp:Parameter Name="Commision" Type="Boolean" />
                            <asp:Parameter Name="CommisionRate" Type="Decimal" />
                            <asp:Parameter Name="BillingPerson" Type="String" />
                            <asp:Parameter Name="BillingMail" Type="String" />
                            <asp:Parameter Name="DeliveryChannelId" Type="Int32" />
                            <asp:Parameter Name="DeliveryByCheckout" Type="Boolean" />
                            <asp:Parameter Name="GrossBilling" Type="Boolean" />
                            <asp:Parameter Name="BillingDoc" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                
                    <asp:ObjectDataSource ID="dsMarket" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.MarketTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsParentTourOp" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.ParentTourOpTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TourOpID" QueryStringField="TOID" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsDeliveryChannel" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.DeliveryChannelTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCountryCode" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.CountryCodeTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsPayMode" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.PayModeTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsPayCond" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.PayCondTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsPayCondExt" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.PayCondExtTableAdapter">
                    </asp:ObjectDataSource>
                
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

