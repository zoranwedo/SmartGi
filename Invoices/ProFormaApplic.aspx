<%@ Page Title="" Language="VB" MasterPageFile="~/Invoices/masterProForma.master" AutoEventWireup="false" CodeFile="ProFormaApplic.aspx.vb" Inherits="Invoices_ProFormaApplic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    ProForma Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" Runat="Server">
 <asp:UpdatePanel runat="server" ID="pnlPop">
                        <ContentTemplate>
    <div id="InvDet" class="Blue">
 
 <%--<table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/ProFormas.aspx"
                        Text="&lt;&lt; Back to ProForma" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td class="LocalMenuRow">
                    
                </td>
            </tr>
        </table>--%>
 
 
 
    <table style="width: 100%;">
    <tr>
    <td>
    <asp:FormView ID="fvInvoice" runat="server" 
            DataSourceID="dsInvoice" Width="100%" 
            DataKeyNames="HotelId,TourOpId,InvoiceID">
        <EditItemTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG" colspan="2">
                            <asp:Label ID="Label26" runat="server" SkinID="skGridLabel" 
                                Text= '<%# "Proforma Num " &  Eval("InvNumber") %>'/>
                            &nbsp;
                            <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" 
                                Text= '<%# Eval("InvTypeDisp") %>' 
                                Visible='<%# iif(Eval("InvType") >0,True,False) %>' />
                            &nbsp;<asp:Label ID="Label8" runat="server" SkinID="skGridLabel" 
                                Text='<%# Eval("ResGroup") %>' 
                                Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 30px;">
                            &nbsp;
                        </td>
                        <td class="GridRow2B" style="padding: 6px;">
                            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                                <tr>
                                    <td style="padding-left: 5px;">
                                        Hotel
                                    </td>
                                    <td style="padding-left: 5px;" colspan="4">
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                            BackColor="White" CssClass="TextBox" DataSourceID="dsAllHotels" 
                                            DataTextField="Hotel" DataValueField="HotelID" Enabled="False" 
                                            SelectedValue='<%# Eval("HotelId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                  
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="padding-left: 5px;">
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" style="padding-left: 5px;" colspan="4">
                                        (<asp:Label ID="Label28" runat="server" Text='<%# Eval("TourOpId") %>'></asp:Label>
                                        )
                                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("BillingName") %>'></asp:Label>
                                        &nbsp;(<asp:Label ID="Label36" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>
                                        )</td>
                                    
                                </tr>
                                <tr style=" height:10px; ">
                                    <td class="SelectRow1B"  style="height:15px; padding-left: 5px; ">
                                        CheckIn</td>
                                    <td class="SelectRow1B" style="height:15px; padding-left: 5px; ">
                                        CheckOut</td>
                                    <td class="SelectRow1B" style="height:15px; padding-left: 5px; ">
                                        Nhgt</td>
                                    <td class="SelectRow1B" >
                                        Inv Date
                                    </td>
                                    <td class="SelectRow1B" >
                                        &nbsp;<asp:Label ID="Label15" runat="server" Text="Amount"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="1" style="padding-left: 5px; ">
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>'></asp:Label>
                                        </td>
                                    <td class="GridRow1B" style="padding-left: 5px; ">
                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>'></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="padding-left: 5px; ">
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("Nights") & "nights" %>'></asp:Label>
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                            ControlToValidate="txtDate" Display="None" ErrorMessage="Input date!" 
                                            Operator="DataTypeCheck" Type="Date">Input date!</asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="CompareValidator8">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvDate", "{0:d}") %>'></asp:TextBox>
                                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="txtDate">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:Label ID="Label37" runat="server" 
                                            Text='<%# Eval("Amount", "{0:N2}") %>' 
                                            Visible="<%# ModificationRights.RightsOperatorAdmin %>"></asp:Label>
                                        <asp:Label ID="Label38" runat="server" 
                                            Text='<%# Eval("HAmount", "{0:N2}") %>'></asp:Label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                         Proforma Note</td>
                                    <td class="GridRowClear" style="padding-left: 5px;" colspan="4">
                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvRefText") %>'></asp:TextBox>
                                    </td>
                                  
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                        Operator Note</td>
                                   
                                    <td  colspan="4" style="padding-left: 5px;">
                                        <asp:TextBox ID="TextBox13" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvPrnText") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                        Comment</td>
                                  
                                    <td colspan="4" style="padding-left: 5px;">
                                        <asp:TextBox ID="TextBox14" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvComment") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1T" style="padding-left: 5px;">
                                        &nbsp;</td>
                                    <td class="GridRow1T" style="padding-left: 5px;">
                                        &nbsp;</td>
                                    <td class="GridRow1T" style="padding-left: 5px;">
                                        &nbsp;</td>
                                    <td class="GridRow1T" style="padding-left: 5px;">
                                        &nbsp;</td>
                                    <td align="right" class="GridRow1T">
                                        &nbsp;<asp:Button ID="Button2" runat="server" CommandName="Update" 
                                            SkinID="skBtnBase" Text="Save" />
                                        &nbsp;<asp:Button ID="Button3" runat="server" CommandName="Cancel" 
                                            SkinID="skBtnBase" Text="Cancel" />
                                        &nbsp;</td>
                                         <td class="GridRowClear">
                                    
                                             &nbsp;</td>
                                    <td class="GridRowClear">
                                    </td>
                                </tr>
                            </table>
                        </td>
                       
                    </tr>
                </table>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG" colspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Create New Proforma For:" 
                                SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 30px;">
                            &nbsp;
                        </td>
                        <td class="GridRow2B" style="padding: 6px;">
                            <table cellpadding="0" cellspacing="0" style="width: 640px;">
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Proforma Type</td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="TextBox" 
                                            SelectedValue='<%# Bind("InvType") %>' AutoPostBack="True" 
                                            AppendDataBoundItems="True" >
                                            <asp:ListItem Value="0">Stay</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                            <asp:ListItem Value="2">Cancel</asp:ListItem>
                                            <asp:ListItem Value="3">No-Show</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        <asp:Label ID="lblGroup" runat="server" Text="Group" 
                                            Visible='<%# iif(hfInvType.Value ="1",True,False) %>'></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:TextBox ID="txtInvType" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("ResGroup") %>' 
                                            Visible='<%# iif(hfInvType.Value ="1",True,False) %>'></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="HotelID" 
                                            SelectedValue='<%# Bind("HotelId") %>' 
                                            AutoPostBack="True" >
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsTOAll"
                                            DataTextField="TourOp" DataValueField="TourOpID" 
                                            SelectedValue='<%# Bind("TourOpId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Check In</td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:TextBox ID="txtCheckIn" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CheckIn", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckIn_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" TargetControlID="txtCheckIn" />
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        Check Out</td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:TextBox ID="txtCheckOut" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CheckOut", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckOut_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" TargetControlID="txtCheckOut" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Ref Text</td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvRefText") %>'></asp:TextBox>
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        Print Text</td>
                                    <td class="GridRow1B" style="width: 240px;">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvPrnText") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 120px; padding-left: 5px;">
                                        Comment</td>
                                    <td class="GridRowClear" colspan="3">
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("InvComment") %>'></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td class="GridLabelBG" colspan="6">
                                                    <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "Invoice No " & Eval("InvNumber") %>' />
                                                    <%--<asp:Label ID="Label36" runat="server" SkinID="skGridLabel" Text='<%# "(" & Eval("InvoiceState") & ")" %>' />--%>
                                                    <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" Text='<%# "|" & Eval("InvTypeDisp") %>'
                                                        Visible='<%# iif(Eval("InvType") >0,True,False) %>' />
                                                   <asp:Label ID="Label8" runat="server" SkinID="skGridLabel" Text='<%# "|" & Eval("ResGroup") %>'
                                                        Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 30px;" rowspan="8">&nbsp;</td>
                                                <td style="width: 120px;" class="GridRow1B"><b>Hotel</b></td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" BackColor="White"
                                                        CssClass="TextBox" DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="HotelID"
                                                        Enabled="False"  SelectedValue='<%# Eval("HotelId") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 10px;" rowspan="8">&nbsp;</td>
                                                <td style="width: 120px;" rowspan="8" valign="top">
                                                    &nbsp;</td>
                                                <td rowspan="8">&nbsp;</td>
                                           </tr>
                                            <tr>
                                                <td style="width: 120px;" class="GridRow1B"><b>Tour Operator</b></td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    (<asp:Label ID="Label25" runat="server" Text='<%# Eval("TourOpId") %>'></asp:Label>)
                                                    <asp:Label ID="Label24" runat="server" Text='<%# Eval("BillingName") %>'></asp:Label>
                                                    (<asp:Label ID="Label27" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRow1B" colspan="2" style="padding: 4px 0px 4px 0px;" >
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr><b>
                                                            <td class="SelectRow1B" style="width: 20%;" >CheckIn</td>
                                                            <td class="SelectRow1B" style="width: 20%;" >CheckOut</td>
                                                            <td class="SelectRow1B" style="width: 20%;" >Nights</td>
                                                            <td class="SelectRow1B" style="width: 20%;" >Inv Date</td>
                                                            <td class="SelectRow1B" style="width: 20%;" >Amount</td>
                                                        </b></tr>
                                                        <tr>
                                                            <td class="GridRowClear" >
                                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear" >
                                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear" >
                                                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("Nights") %>' />
                                                            </td>
                                                            <td class="GridRowClear" >
                                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("InvDate", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear" >
                                                                <asp:Label ID="lblAmount0" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>'
                                                                    Visible="<%# cbHotel.Checked=false %>" />
                                                                <asp:Label ID="lblHAmount0" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'
                                                                    Visible="<%# cbHotel.Checked %>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="5">
                                                               <asp:FormView ID="FormView1" runat="server" DataSourceID="dsInvBalance" 
                                                                    DataKeyNames="AppAmount" Visible="<%# Not ModificationRights.RightsHotel %>" 
                                                                    Width="100%">
                                                                   <EditItemTemplate>
                                                                    
                                                                   </EditItemTemplate>
                                                                   <InsertItemTemplate>
                                                                    
                                                                   </InsertItemTemplate>
                                                                   <ItemTemplate>
                                                                       Balance:
                                                                       <asp:Label ID="BalanceLabel" runat="server" 
                                                                           Text='<%# Eval("Balance", "{0:N}") %>' />
                                                                       &nbsp;&nbsp; On:
                                                                       <asp:Label ID="BalanceDateLabel" runat="server" 
                                                                           Text='<%# Eval("BalanceDate", "{0:d}") %>' />
                                                                       &nbsp;&nbsp; (Applied:
                                                                       <asp:Label ID="AppAmountLabel" runat="server" 
                                                                           Text='<%# Eval("AppAmount", "{0:N}") %>' />)
                                                                      
                                                                   </ItemTemplate>
                                                                </asp:FormView>
                                                                <asp:ObjectDataSource ID="dsInvBalance" runat="server" 
                                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                                    TypeName="dsInvoicesTableAdapters.InvAccBalanceTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </td>
                                                           
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">Reference</td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvRefText") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">Note</td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label29" runat="server" Text='<%# Eval("InvPrnText") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">Comment</td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label35" runat="server" Text='<%# Eval("InvComment") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRowClear">Delivery Date</td>
                                                <td style="width: 580px; padding-top: 2px; vertical-align:middle;" class="GridRowClear">
                                                    <asp:TextBox ID="txtDelivery" runat="server" CssClass="TextBox" Width="450px"
                                                        Text='<%# Bind("DeliveryDate") %>'
                                                        Enabled='<%# iif(Eval("State")=5 OR Eval("State")=6, True,False) And ModificationRights.RightsOperatorAdmin %>'> </asp:TextBox>
                                                    <asp:CalendarExtender ID="txtDelivery_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                        Enabled="True" TargetControlID="txtDelivery">
                                                    </asp:CalendarExtender>
                                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtDelivery"
                                                        Display="None" ErrorMessage="Date field!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                        Enabled="True" TargetControlID="CompareValidator7">
                                                    </asp:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
            </div>
        </ItemTemplate>
        </asp:FormView>
                    </td>
                    </tr>
                    </table>
     
        <asp:HiddenField ID="hfHotel" runat="server" />
        <asp:HiddenField ID="hfRoom" runat="server" />
        <asp:HiddenField ID="hfInvType" runat="server" />
        <asp:HiddenField ID="hfBillID" runat="server" />
      </div> 
      <div class="Blue">
        <asp:ObjectDataSource ID="dsMix" runat="server"
            SelectMethod="GetDataMix" 
              TypeName="ProFormaApliicTableAdapters.InvMixDetailTableAdapter" 
              UpdateMethod="ProFormaPpApp">
            <UpdateParameters>
                <asp:Parameter Name="DetailID" Type="Int32" />
                <asp:ControlParameter ControlID="GridView1" Name="PrePayID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Full" Type="Boolean" />
                <asp:Parameter Name="Part" Type="Decimal" />
                <asp:Parameter Direction="InputOutput" Name="PPLeft" Type="Object" />
                <asp:Parameter Direction="InputOutput" Name="ProLeft" Type="Object" />
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                    PropertyName="Value" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="false" Name="HRate" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
     
         <asp:ObjectDataSource runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActive" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
        UpdateMethod="Update" ID="dsAllHotels">
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HotelID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
            <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
            <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
            <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
            <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
            <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
            <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
            <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
            <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
            <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
            <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
            <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
            <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
            <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
            <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
            <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
            <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG ">
                    <asp:Label ID="Label14" runat="server" Text="PrePay" CssClass="GridLabel" 
                        Height="26px"></asp:Label>

                    <asp:CheckBox ID="cbAll" runat="server" Text="All PrePay" ForeColor="White" Height="26px" 
                        AutoPostBack="True" />

                &nbsp;
                            <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" ForeColor="White" 
                                Height="26px" AutoPostBack="True" Visible="False" />

                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                DataSourceID="dsPrePay" SelectedIndex="0" DataKeyNames="PrePayID">
                                <RowStyle CssClass="GridRow1B" />
                                <SelectedRowStyle CssClass="SelectRow1T" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                                <Columns>
                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                        ShowSelectButton="True" />
                                    <asp:BoundField DataField="PrePayID" HeaderText="PrePayID" 
                                        SortExpression="PrePayID" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TourOpID" 
                                        HeaderText="TOID" SortExpression="TourOpID" Visible="False" />
                                    <asp:BoundField DataField="HotelID" 
                                        HeaderText="HID" SortExpression="HotelID" Visible="False" />
                                    <asp:BoundField DataField="PPDate" HeaderText="Date" DataFormatString="{0:d}" 
                                        HtmlEncode="False" SortExpression="PPDate">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PPValue" HeaderText="Value" SortExpression="PPValue">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PPFreeValue" HeaderText="RestValue" 
                                        SortExpression="PPFreeValue">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    - NO PREPAYMENT&nbsp; -&nbsp;</EmptyDataTemplate></asp:GridView>
                            <asp:ObjectDataSource ID="dsPrePay" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="ProFormaApliicTableAdapters.SelectUserPrePayTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                        PropertyName="Value" Type="String" />
                                    <asp:ControlParameter ControlID="cbAll" Name="All" PropertyName="Checked" 
                                        Type="Boolean" />
                                
                                    <asp:Parameter Name="HotelID" Type="Int32" />
                                    <asp:Parameter Name="TourOpID" Type="Int32" />
                                
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </ContentTemplate></asp:UpdatePanel>
                </td>
            </tr>
        </table>
        </div>
        <br />
        <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG ">
                    <asp:Label ID="Label31" runat="server" Text="Details" CssClass="GridLabel" 
                        Height="26px"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gvMix" runat="server" AutoGenerateColumns="False" DataKeyNames="DetailID"
                                DataSourceID="dsMix">
                                <RowStyle CssClass="GridRow1B" />
                                <SelectedRowStyle CssClass="SelectRow1T" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                                <Columns>
                                    <asp:BoundField DataField="DetText" HeaderText="Guest Name" >
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Arrival" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="txtStart" runat="server" 
                                                Text='<%# Bind("EnterDate", "{0:d}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EnterDate") %>'></asp:TextBox></EditItemTemplate><ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Departure" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="txtFinish" runat="server" 
                                                Text='<%# Bind("ExitDate", "{0:d}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExitDate") %>'></asp:TextBox></EditItemTemplate><ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EnterDate" DataFormatString="{0:d}" 
                                        HeaderText="Arrival" HtmlEncode="False" SortExpression="EnterDate" />
                                    <asp:BoundField DataField="ExitDate" DataFormatString="{0:d}" 
                                        HeaderText="Departure" HtmlEncode="False" SortExpression="ExitDate" />
                                    <asp:BoundField DataField="Nights" HeaderText="Nts#" ReadOnly="True">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BookingDate" DataFormatString="{0:d}" HeaderText="Bk.Date">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BookingVoucher" HeaderText="Voucher">
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
                                    <asp:BoundField DataField="ChargeNights" HeaderText="ChargeNights" 
                                        Visible="False">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomsNum" HeaderText="Rms#">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateCodeId" HeaderText="Rate">
                                        <ItemStyle Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateID" HeaderText="RateID" Visible="False" />
                                    <asp:BoundField DataField="RateType" HeaderText="RateType" Visible="False" />
                                    <asp:CheckBoxField DataField="HotelRate" HeaderText="HotelRate" Visible="False" />
                                    <asp:BoundField DataField="AmountAd" HeaderText="AmountAd" Visible="False" />
                                    <asp:BoundField DataField="AmountCh" HeaderText="AmountCh" Visible="False" />
                                    <asp:BoundField DataField="AmountEx" HeaderText="AmountEx" Visible="False" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:CheckBoxField DataField="Payed" HeaderText="Payed" 
                                        SortExpression="Payed" />
                                    <asp:BoundField DataField="PayAmount" HeaderText="PayAmount" 
                                        SortExpression="PayAmount" />
                                    <asp:TemplateField HeaderText="All Am">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbAllAm" runat="server" 
                                                ToolTip="Check All Amount for application" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="SelectRow" />
                                        <ItemStyle CssClass="SelectRow" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PreAmount" SortExpression="PreAmount">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" 
                                                ToolTip="insert Amount for application"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToValidate="txtAmount" Display="None" 
                                                ErrorMessage="Must input decimal value" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                            <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="CompareValidator1">
                                            </asp:ValidatorCalloutExtender>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="SelectRow" />
                                        <ItemStyle CssClass="SelectRow" Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            &nbsp;
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                ImageUrl="~/Images/accept_inline.gif" Text="Update" 
                                                Visible='False' 
                                                CommandArgument='<%# Eval("DetailID") %>' />
                                            <asp:Button ID="Button1" runat="server" 
                                                CommandArgument='<%# Eval("DetailID") %>' CommandName="Applic" 
                                                SkinID="skBtnBase" Text="Applic" 
                                                onclientclick="return confirm('Are you sure?')" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="SelectRow" />
                                        <ItemStyle Width="30px" CssClass="SelectRow" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                <table cellpadding="0" cellspacing="0"  >
                                        <tr style=" height:20" >
                                        
                                            <td style="width: 360px; height:20px" >
                                                Guest Name</td><td style="width: 80px;height:20px" >
                                                Bk Date</td><td style="width: 80px;height:20px" >
                                                Bk Voucher</td><td style="width: 50px;height:20px" >
                                                Room</td><td style="width: 50px; height:20px" >
                                                MP</td><td style="width: 25px; height:20px" >
                                                Ad</td><td style="width: 25px; height:20px" >
                                                <asp:Label ID="lblCh1" runat="server" Text="Ch1"></asp:Label></td><td style="width: 25px; height:20px">
                                                <asp:Label ID="lblCh2" runat="server" Text="Ch2"></asp:Label></td><td style="width: 25px; height:20px" >
                                                <asp:Label ID="lblCh3" runat="server" Text="Ch3"></asp:Label></td><td style="width: 25px; height:20px">
                                                <asp:Label ID="lblCh4" runat="server" Text="Ch4"></asp:Label></td><td style="width: 25px; height:20px" >
                                                Rms#</td></tr></table></EmptyDataTemplate></asp:GridView></ContentTemplate></asp:UpdatePanel>
                </td>
            </tr>
        </table>
       </div>
    <div class="Blue">

        
        <asp:HiddenField ID="dummy" runat="server" />
        
        
       <asp:Button id="btnShowPopup" runat="server" Style="display: none"/>
                     <asp:ModalPopupExtender 
                          ID="mdlPopup" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlPopup" 
                          CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
             <asp:Panel ID="pnlPopup" runat="server" BackColor="White" Style="display: none">
                <asp:UpdatePanel ID="updPnlRateDetail" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                     <div class="Blue">
                    
                     <table cellpadding="0" cellspacing="0" >
                         <tr>
                            <td class="GridLabelBG">
                             <asp:Label ID="lblRateDetail" runat="server" Text="Available Rates" SkinID="skGridLabel"></asp:Label></td></tr><tr>
                           <td class="GridBorder">
                        <p style="text-align: center;">
                              &nbsp;</p><p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnSave" runat="server" Text="Save" SkinID="skBtnBase" 
                                Visible="False" />
                            <asp:Button ID="btnSaveIns" runat="server" SkinID="skBtnBase" Text="Save" 
                                Visible="False" />
                            &nbsp;
                            <asp:Button ID="btnClose" runat="server" Text="Close" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
                </div>
                    </ContentTemplate>                
                </asp:UpdatePanel>
                             
            </asp:Panel>

        
        
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none"><%-- Style="display: none">--%>
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label></td></tr><tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label></p><p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                            <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>

         <asp:ObjectDataSource runat="server" InsertMethod="InsertQuery" 
            SelectMethod="GetDataByID" TypeName="dsInvoicesTableAdapters.InvoiceTableAdapter"
        UpdateMethod="UpdateQuery" ID="dsInvoice" DeleteMethod="DeleteQuery">
             <DeleteParameters>
                 <asp:Parameter Name="InvoiceID" Type="Int32" />
             </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="InvDate" Type="DateTime" DefaultValue="" />
            <asp:Parameter Name="InvRefText" Type="String" />
            <asp:Parameter Name="InvPrnText" Type="String" />
            <asp:Parameter Name="InvComment" Type="String" />
            <asp:ControlParameter ControlID="hfUsername" Name="EditUser" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="EditDate" Type="DateTime" DefaultValue="" />
            <asp:QueryStringParameter Name="Original_InvoiceID" 
                QueryStringField="InvoiceID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" 
                Type="Int32" DefaultValue="" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="InvNumber" Type="Int32" DefaultValue=""></asp:Parameter>
            <asp:Parameter Name="CheckOut" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="InvDoc" Type="String" DefaultValue="PRO"></asp:Parameter>
            <asp:Parameter DefaultValue="" Name="InvType" Type="Int32" />
            <asp:Parameter Name="ResGroup" Type="String" />
            <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="CheckIn" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="InvRefText" Type="String" />
            <asp:Parameter Name="InvPrnText" Type="String" />
            <asp:Parameter Name="InvComment" Type="String" />
            <asp:ControlParameter ControlID="hfUsername" Name="CreateUser" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
     

 
                                         
                                              
</div>                                                
 </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

