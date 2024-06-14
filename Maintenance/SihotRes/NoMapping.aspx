<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false" CodeFile="NoMapping.aspx.vb" Inherits="Maintenance_SihotRes_NoMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Missing Mappings On Reservation Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                        <table cellpadding="0" cellspacing="0">
                           <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Last Checked On
                                </td>
                                <td class="GridRowClear" style="width: 380px;">
                                    <asp:TextBox ID="fltDate" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltDateExt" runat="server" TargetControlID="fltDate"
                                        WatermarkCssClass="WaterMark" WatermarkText="Today if empty" />
                                    <asp:CalendarExtender ID="fltDate_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltDate" Enabled="True" />
                                    <asp:CompareValidator ID="fltDate_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltDate" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltDate_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltDate_Date" />
                                </td>
                                <td class="GridRowClear" style="width: 120px;height: 30px; padding-top: 2px; text-align: right;">
                                    <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
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
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblToday" runat="server" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:DataList ID="dlFiles" runat="server" DataSourceID="dsNoMapFiles">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <th class="GridRow2B" colspan="5" >File Name</th>
                                    <th class="GridRow2B" style="width: 100px;"  >File Date</th>
                                    <th class="GridRow2B" style="width: 150px;" >Import Time</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                                <tr style="height: 25px; font-weight: bold;">
                                    <td class="GridRowClear" colspan="7" style="text-align: left;" >
                                        <asp:HiddenField ID="hfFileID" runat="server" Value='<%# Eval("FileID") %>' />
                                        <asp:Label ID="lblFileName" runat="server" Text='<%# Eval("FileName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="5" >&nbsp;</td>
                                    <td class="GridRowClear" style="text-align: center;" >
                                        <asp:Label ID="lblFileDate" runat="server" Text='<%# Eval("FileDate","{0:d}") %>' />
                                    </td>
                                    <td class="GridRowClear" style="text-align: center;" >
                                        <asp:Label ID="lblExceptTime" runat="server" Text='<%# Eval("ExceptTime") %>' />
                                    </td>
                                <tr>
                                    <td class="GridRowClear" style="width: 48px;" >&nbsp;</td>
                                    <th class="GridRow1T" style="width: 50px;" >Market</th>
                                    <th class="GridRow1T" style="width: 70px;" >Hotel Code</th>
                                    <th class="GridRow1T" style="width: 70px;" >Complex</th>
                                    <th class="GridRow1T" colspan="3" >SIHOT Company</th>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 48px;" >&nbsp;</td>
                                    <td class="SelectRowClear" colspan="6" >Missing Hotel Mappings</td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 48px;" >&nbsp;</td>
                                    <td class="GridRowClear" colspan="6" >
                                        <asp:GridView ID="gvHotels" runat="server" DataSourceID="dsHotels" 
                                            AutoGenerateColumns="false" ShowHeader="false" GridLines="None">
                                            <Columns>
                                                <asp:TemplateField >
                                                    <ItemTemplate>&nbsp;</ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="HotelCode" HeaderText="" >
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ComplexCode" HeaderText="" >
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div style="height: 25px; padding-left: 50px; font-style: italic; font-weight: bold;">
                                                    No hotel mappings are missing
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="dsHotels" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            TypeName="dsCRSTableAdapters.crsNoHotelMapTableAdapter" SelectMethod="GetData">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfFileID" Name="fileID" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 48px;" >&nbsp;</td>
                                    <td class="SelectRowClear" colspan="6" >Missing Tour Operator Mappings</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 30px;" >&nbsp;</td>
                                    <td class="GridRow1B" colspan="6" >
                                        <asp:GridView ID="gvTourOps" runat="server" DataSourceID="dsTourOps" 
                                            AutoGenerateColumns="false" ShowHeader="false" GridLines="None">
                                            <Columns>
                                                <asp:BoundField DataField="MarketID" HeaderText="" > 
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="HotelCode" HeaderText="" >
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ComplexCode" HeaderText="" >
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CompanyCID" HeaderText="" >
                                                    <ItemStyle Width="100px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CompanyName" HeaderText="" >
                                                    <ItemStyle Width="250px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div style="height: 25px; padding-left: 50px; font-style: italic; font-weight: bold;">
                                                    No tour operator mappings are missing
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="dsTourOps" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            TypeName="dsCRSTableAdapters.crsNoTourOpMapTableAdapter" SelectMethod="GetData">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfFileID" Name="fileID" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                <asp:Panel ID="NoDataPanel" runat="server" Visible='<%# dlFiles.Items.Count=0 %>' >
                                <tr>
                                    <td style="width: 48px;" ></td>
                                    <td style="width: 50px;" ></td>
                                    <td style="width: 70px;" ></td>
                                    <td style="width: 70px;" ></td>
                                    <td style="width: 100px;" ></td>
                                    <td style="width: 100px;" ></td>
                                    <td style="width: 160px;" ></td>
                                </tr>
                                <tr style="height: 25px;">
                                    <td>&nbsp;</td>
                                    <td colspan="6" style="font-style: italic; font-weight: bold;" >
                                        <asp:Label ID="lblFileDate" runat="server" Text="There are no imported files with missing mappings on selected date." />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></thtd
                                    <td></td>
                                </tr>
                                </asp:Panel>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsNoMapFiles" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsCRSTableAdapters.crsNoTourOpFileTableAdapter" 
        SelectMethod="GetData" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fltDate" Name="OnDate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
