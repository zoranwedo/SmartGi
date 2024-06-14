<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ProFormaResCreate.aspx.vb" Inherits="Invoices_ProFormaResCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
Create ProForma 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
  <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="ddlHotel" Display="None" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Tour Operator
                                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="ddlTO" Display="None" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Chechk In<asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equal or greater than..." />
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="fltStart" Display="None" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; padding-left:5px;">
                                        Check Out<asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
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
                                                                                WatermarkText="Check in date equal or less than..." />
                                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                                                                CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                                                            </asp:CalendarExtender>
                                                                            <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" 
                                                                                TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                                                                WatermarkText="Check in date equal or less than..." />
                                                                            <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" 
                                                                                CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                                                            </asp:CalendarExtender>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                                ControlToValidate="fltFinish" Display="None" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                                                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" 
                                                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                                                            </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="4" style="height: 30px; padding-top: 5px">
                                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />
                                        &nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="ProFormaTableAdapters.HotelMapTableAdapter" 
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HotelHID" Type="String" />
                        <asp:Parameter Name="Hotel" Type="String" />
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelHID" Type="String" />
                        <asp:Parameter Name="Hotel" Type="String" />
                        <asp:Parameter Name="HotelID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                
                
                <asp:Panel runat="server" ID="pnlCnt" Visible="False" Width="1017px" >

                <table cellpadding="0" cellspacing="0">
                 
                 
                 
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Groups"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                
                              <asp:GridView ID="gvGroups" runat="server" AutoGenerateColumns="False" DataSourceID="dsGroupRes" 
                    SkinID="skGridView" ShowFooter="True" Width="450px" DataKeyNames="ResGroup">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/select_.gif" Text="Select" 
                                    CommandArgument='<%# Eval("ResGroup") %>' />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/select_.gif" Text="Select" 
                                    CommandArgument='<%# DBNull.value %>' onclick="ImageButton1_Click" />
                                <asp:CheckBox ID="cbAll" runat="server" Visible="False" />
                            </FooterTemplate>
                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group" SortExpression="ResGroup">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResGroup") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ResGroup") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label5" runat="server" Text="All Reservations"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>  
                                
                                
                                
                            </td>
                        </tr>
                  
                   
                </table>
                
                <br />
                <div class= "Red">
                <table cellpadding="0" cellspacing="0">
                 
                 
                 
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="Label2" runat="server" SkinID="skGridLabel" Text="Reservations"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                
                              <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilteredReservation" 
                    SkinID="skGridView" ShowFooter="True" Width="800px" DataKeyNames="ResID" SelectedIndex="0">
                    <Columns>
                        <asp:BoundField DataField="ResID" HeaderText="ResID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ResID" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Name" SortExpression="LastName">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" 
                                    onclick="LinkButton1_Click">Create ProForma</asp:LinkButton>
                            </FooterTemplate>
                            <ItemStyle Width="350px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BkDate" HeaderText="BkDate" 
                            SortExpression="BkDate" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BkNumber" HeaderText="BkNumber" 
                            SortExpression="BkNumber" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" >
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="CheckIn" SortExpression="CheckIn">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("CheckIn", "{0:d}") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("CheckOut", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CheckIn") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderTemplate>
                                <span style="text-decoration: underline">Check In</span><br />
                                <span style="text-decoration: underline">Check Out</span>
                            </HeaderTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RoomTypeHID" HeaderText="RoomH" 
                            SortExpression="RoomTypeHID" >
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nights" HeaderText="Ngt" 
                            SortExpression="Nights" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Adult" HeaderText="Ad" SortExpression="Adult" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Junior" HeaderText="Jn" 
                            SortExpression="Junior" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Child" HeaderText="Ch" SortExpression="Child" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Infant" HeaderText="Inf" 
                            SortExpression="Infant" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RateHID" HeaderText="RateHID" 
                            SortExpression="RateHID" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rooms" HeaderText="Rooms" SortExpression="Rooms" >
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RoomNum" HeaderText="Room#" 
                            SortExpression="RoomNum" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ResType" HeaderText="ResType" 
                            SortExpression="ResType" >
                        
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        
                    </Columns>
                </asp:GridView>  
                                
                                
                                
                            </td>
                        </tr>
                  
                   
                </table>
                </div>
                
                </asp:Panel>
                
                
                <asp:ObjectDataSource ID="dsFilteredReservation" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    
                    
                    TypeName="ProFormaTableAdapters.ReservationForGroupTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="fltStart" Name="CheckIn" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="CheckOut" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="gvGroups" Name="ResGroup" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsGroupRes" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="ProFormaTableAdapters.PreInv_CreGroupTableAdapter" 
                    InsertMethod="ProFormaInsert">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="CheckIn" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="CheckOut" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="CheckIn" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="CheckOut" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                            PropertyName="Value" Type="String" />
                        <asp:Parameter Name="ResGroup" Type="String" DefaultValue="MURPHY" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                
                  <asp:HiddenField ID="dummy" runat="server" />
          <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel" CancelControlID="btnNo"  OkControlID="btnYes" DropShadow="True" Enabled="True" BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
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
                    <p style="text-align: right;" class="GridRow2TB">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>

    </asp:Panel>  
                
          <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
  </ContentTemplate>
        </asp:UpdatePanel>       
</asp:Content>

