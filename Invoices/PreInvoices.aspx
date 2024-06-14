<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="PreInvoices.aspx.vb" Inherits="Invoices_Invoices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
PreInvoices
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Green">
        
        <table cellpadding="0" cellspacing="0">
            
            <tr>
                <td style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" >
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="Panel1" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="Label1" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="Panel2" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0">
                                <tr style="width: 600px;">
                                    <td class="GridRow1B" style="width: 100px;">
                                        Hotel
                                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Tour Operator
                                        </td>
                                    <td class="GridRow1B" colspan="3" >
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTOAll" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByUser" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter" UpdateMethod="Update">
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
                                                <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" 
                                                    Type="String" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="TourOpID" Type="Int32" />
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
                                                <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Group</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        FolioFull</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="txtFolio" runat="server" CssClass="TextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Check In From</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equals or later than" />
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; padding-left:5px;">
                                        Check In To&nbsp;
                                    </td>
                                    <td class="GridRow1B" style="width: 200px;">
                                                                            <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                                                                ControlToValidate="fltFinish" Display="None" ErrorMessage="Only date input" 
                                                                                Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                                            <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" 
                                                                                runat="server" Enabled="True" TargetControlID="CompareValidator8">
                                                                            </asp:ValidatorCalloutExtender>
                                                                            <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                                                            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" 
                                                                                TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                                                                WatermarkText="Check In date equals or before than" />
                                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                                                                CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                                                            </asp:CalendarExtender>
                                                                            <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" 
                                                                                TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                                                                WatermarkText="Check in date equal or less than..." />
                                                                            <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" 
                                                                                CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                                                            </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Bk Date From</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltBkDateFrom" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltBkDateFrom_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltBkDateFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="fltBkDateFrom_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateFrom">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; padding-left:5px;">
                                        Bk Date To</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltBkDateTo" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltBkDateTo_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltBkDateTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="fltBkDateTo_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateTo">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Created From</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltCreatedFrom" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltCreatedFrom_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltCreatedFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="fltCreatedFrom_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreatedFrom">
                                        </asp:CalendarExtender>
                                        <asp:TextBoxWatermarkExtender ID="fltCreatedFrom_TextBoxWatermarkExtender2" 
                                            runat="server" TargetControlID="fltCreatedFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="fltCreatedFrom_CalendarExtender2" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreatedFrom">
                                        </asp:CalendarExtender>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" 
                                            TargetControlID="fltBkDateFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateFrom">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; padding-left:5px;">
                                        Created<br />
                                        To</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" 
                                            runat="server" TargetControlID="fltBkDateTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateTo">
                                        </asp:CalendarExtender>
                                        <asp:TextBox ID="fltCreatedTo" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltCreatedTo_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltCreatedTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check in date equal or less than..." />
                                        <asp:CalendarExtender ID="fltCreatedTo_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreatedTo">
                                        </asp:CalendarExtender>
                                        <asp:TextBoxWatermarkExtender ID="fltCreatedTo_TextBoxWatermarkExtender2" 
                                            runat="server" TargetControlID="fltCreatedTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check in date equal or less than..." />
                                        <asp:CalendarExtender ID="fltCreatedTo_CalendarExtender2" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreatedTo">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" 
                                            SkinID="skBtnFilter" />
&nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                            PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
                <table cellpadding="0" cellspacing="0">
                    
                    <asp:Panel runat="server" ID="pnlCnt" Visible="False" Width="700px" >

                    
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="PreInvoices"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilteredInvoices" 
                    SkinID="skGridView" AllowPaging="True" PageSize="30">
                    <Columns>
                        
                        <asp:BoundField DataField="FolioFull" HeaderText="FolioFull" 
                            SortExpression="FolioFull" />
                        <asp:BoundField DataField="HotelId" 
                            HeaderText="HotelId" SortExpression="HotelId" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" 
                            SortExpression="TourOpId" />
                        <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" 
                            SortExpression="ResGroup" />
                        <asp:BoundField DataField="CheckIn" HeaderText="CheckIn" 
                            SortExpression="CheckIn" DataFormatString="{0:d}" HtmlEncode="False" />
                        
                        <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" 
                            SortExpression="CheckOut" DataFormatString="{0:d}" HtmlEncode="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Nights" HeaderText="Nights" 
                            SortExpression="Nights" ReadOnly="True" />
                        <asp:BoundField DataField="BkDate" HeaderText="BkDate" 
                            SortExpression="BkDate" DataFormatString="{0:d}" HtmlEncode="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="BkNumber" HeaderText="BkNumber" 
                            SortExpression="BkNumber" />
                        <asp:BoundField DataField="RoomTypeId" 
                            HeaderText="RoomTypeId" SortExpression="RoomTypeId" >
                        </asp:BoundField>
                        <asp:BoundField DataField="MealPlanId" 
                            HeaderText="MealPlanId" SortExpression="MealPlanId" >
                        </asp:BoundField>
                        <asp:BoundField DataField="PreInvText" HeaderText="PreInvText" 
                            SortExpression="PreInvText" />
                        <asp:BoundField DataField="Adult" HeaderText="Adult" 
                            SortExpression="Adult" />
                        <asp:BoundField DataField="Junior" HeaderText="Junior" 
                            SortExpression="Junior" />
                        <asp:BoundField DataField="Child" HeaderText="Child" 
                            SortExpression="Child" />
                        <asp:BoundField DataField="Infant" HeaderText="Infant" 
                            SortExpression="Infant" />
                        <asp:BoundField DataField="Created" HeaderText="Created" 
                            SortExpression="Created" DataFormatString="{0:d}" HtmlEncode="False" />
                        <asp:BoundField DataField="Modified" HeaderText="Modified" 
                            SortExpression="Modified" DataFormatString="{0:d}" HtmlEncode="False" />
                        <asp:BoundField DataField="PreInvRefText" HeaderText="PreInvRefText" 
                            SortExpression="PreInvRefText" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    </Columns>
                                  <EmptyDataTemplate>
                                      - NO PROINVOICES FOR SELECTED HOTEL -
                                  </EmptyDataTemplate>
                </asp:GridView>  
                                
                                
                                
                            </td>
                        </tr>
                   
                   
                   </asp:Panel>
                   
                    <tr>
                        <td style="text-align: right; padding-top: 5px; height: 30px;">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="ProFormaTableAdapters.FilterUserPreInvoiceTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:Parameter Name="State" Type="Int32" />
                        <asp:ControlParameter ControlID="txtGroup" Name="ResGroup" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtFolio" Name="FolioFull" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="fltBkDateFrom" Name="BkDateFrom" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltBkDateTo" Name="BkDateTo" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:Parameter Name="BkNumber" Type="String" />
                        <asp:ControlParameter ControlID="fltCreatedFrom" Name="CreatedFrom" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltCreatedTo" Name="CreatedTo" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:Parameter Name="ModifiedFrom" Type="DateTime" />
                        <asp:Parameter Name="ModifiedTo" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

