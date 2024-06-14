<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="RepSenior.aspx.vb" Inherits="Reports_Accounting_RepSenior" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Senior Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
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
                            &nbsp; 
                        </asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Advanced Filter" 
                            style="float:right; color: White; padding: 4px; font-weight: bold;" 
                            NavigateUrl="~/Reports/Accounting/RepSeniorFilter.aspx" />
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" >
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRowClear" style="width: 120px;" >
                                    Year
                                </td>
                                <td class="GridRowClear" style="width: 480px;">
                                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="TextBox" />
                                    <asp:CheckBox ID="cbCompare" runat="server" Text="Compare witn previous" TextAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;<asp:Button ID="btGross" runat="server" SkinID="skBtnBase" />
                                    &nbsp;<asp:Button ID="btAdjustments" runat="server" SkinID="skBtnBase" />
                                    &nbsp;<asp:Button ID="btNet" runat="server" SkinID="skBtnBase" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
   <%-- <br />--%>
    <div class="Blue">
        <div style="height: 40px; width: 600px; padding-top: 5px; text-align: left;" >
            <asp:Button ID="btPrint" runat="server" SkinID="skBtnFilter" Text="Print" Width="150px" Visible="false" />
        </div> 
        <asp:HiddenField ID="hfReport" runat="server" Value="0" />
          <asp:Panel runat="server" ID="pnlRpt" Visible="False">  
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbSenior" runat="server" SkinID="skGridLabel" Text="Senior Report:" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvDorados" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsGrossDorados" ShowFooter="True" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="Hotel" HeaderText="DORADOS" FooterText="TOTAL" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="300px" Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="1" HeaderText="Jan" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="13" HeaderText="Jan" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="2" HeaderText="Feb" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="14" HeaderText="Feb" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3" HeaderText="Mar" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="15" HeaderText="Mar" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="4" HeaderText="Apr" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="16" HeaderText="Apr" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="5" HeaderText="May" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="17" HeaderText="May" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="6" HeaderText="Jun" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="18" HeaderText="Jun" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="7" HeaderText="Jul" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="19" HeaderText="Jul" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="8" HeaderText="Aug" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="20" HeaderText="Aug" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="9" HeaderText="Sep" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="21" HeaderText="Sep" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="10" HeaderText="Oct" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="22" HeaderText="Oct" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="11" HeaderText="Nov" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="23" HeaderText="Nov" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="12" HeaderText="Dec" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="24" HeaderText="Dec" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="gvAzules" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsGrossAzules" ShowFooter="True" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="Hotel" HeaderText="AZULES" FooterText="TOTAL" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="300px" Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="1" HeaderText="Jan" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="13" HeaderText="Jan" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="2" HeaderText="Feb" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="14" HeaderText="Feb" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3" HeaderText="Mar" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="15" HeaderText="Mar" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="4" HeaderText="Apr" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="16" HeaderText="Apr" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="5" HeaderText="May" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="17" HeaderText="May" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="6" HeaderText="Jun" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="18" HeaderText="Jun" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="7" HeaderText="Jul" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="19" HeaderText="Jul" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="8" HeaderText="Aug" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="20" HeaderText="Aug" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="9" HeaderText="Sep" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="21" HeaderText="Sep" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="10" HeaderText="Oct" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="22" HeaderText="Oct" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="11" HeaderText="Nov" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="23" HeaderText="Nov" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="12" HeaderText="Dec" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="24" HeaderText="Dec" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
         </asp:Panel>       
        <asp:ObjectDataSource ID="dsGross" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsGrossDet" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossDetTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsGrossAzules" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossTableAdapter"
            SelectMethod="GetAzules" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsGrossDorados" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossTableAdapter"
            SelectMethod="GetDorados">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="dsAdjustment" runat="server"
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsTableAdapter"
            SelectMethod="GetData" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAdjInGross" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjInGrossTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAdjustmentDet" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsDetTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAdjustmentAzules" runat="server"
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsTableAdapter"
            SelectMethod="GetAzules" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAdjustmentDorados" runat="server"
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsTableAdapter"
            SelectMethod="GetDorados" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="dsNet" runat="server"          
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorNetTableAdapter"
            SelectMethod="GetData" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsNetAzules" runat="server"          
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorNetTableAdapter"
            SelectMethod="GetAzules" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsNetDorados" runat="server"          
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorNetTableAdapter"
            SelectMethod="GetDorados" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="RptYear" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

