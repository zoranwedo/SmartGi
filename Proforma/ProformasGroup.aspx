<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProformasGroup.aspx.vb" Inherits="Proforma_ProformasGroup" 
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Proformas: Group
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
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                        <asp:HyperLink ID="btSwitch" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="~/Proforma/ProformasSingle.aspx">
                            Search Single
                        </asp:HyperLink>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnEditPart" runat="server" style="padding-left: 8px;" DefaultButton="btnGoTo">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 120px; text-align: left;">Proforma ID</td>
                                    <td class="GridRow2B" style="width: 70px" align="left">
                                        <uc:InputIntegerControl ID="txtInvID" runat="server" Mandatory="false" />
                                    </td>
                                    <td class="GridRow2B" style="width: 10px;">&nbsp;</td>
                                    <td class="GridRow2B" style="width: 400px; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnGoTo" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px"
                                            FixKind="FixGroup"
                                            NoLocal="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px" 
                                            NoCCI="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 120px;" >Group Code</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                            WatermarkCssClass="WaterMark" WatermarkText="Like Group Code" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">State</td>
                                    <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlStates" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="0">Created</asp:ListItem>
                                            <asp:ListItem Value="1">Modified</asp:ListItem>
                                            <asp:ListItem Value="2">Definitive</asp:ListItem>
                                            <asp:ListItem Value="3">Not Definitive</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                        <span style="float: left;">
                                            <asp:Button ID="btnNew" runat="server" Text="New Group Proforma" SkinID="skBtnBase" CssClass="ButtonRed" />
                                        </span>
                                        <asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
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
    <div class="Blue" style="min-width: 1350px;">
        <asp:Panel runat="server" ID="pnlCnt" Visible="False">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbTitle" runat="server" SkinID="skGridLabel" Text="Group Proformas" Height="26px" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:Panel ID="pnlScroll" runat="server" ScrollBars="Vertical" Height="600">
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" DataKeyNames="InvDocID" DataSourceID="dsFilteredProforma" SkinID="skGridView">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" 
                                            ImageUrl="~/Images/Leads.gif" 
                                            CausesValidation="False" 
                                            CommandName="Details"
                                            CommandArgument='<%# Eval("InvDocID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(ID)" SortExpression="InvDocID">
                                    <ItemTemplate>
                                        (<asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "~/Proforma/ProformDetails.aspx?ProformaID=" & Eval("InvDocID") %>' 
                                            Text='<%# Eval("InvDocID") %>' />)
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="InvDocNum" HeaderText="Proforma Number" 
                                    SortExpression="InvDocNum" >
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="GroupName" HeaderText="Group Code" SortExpression="GroupName">
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOp" >
                                    <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Check In">
                                    <ItemTemplate>
                                        <asp:Label ID="CheckInLabel" runat="server" Text='<%# GetCheckDates(Eval("CheckInFrom","{0:d}"), Eval("CheckInTo","{0:d}")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Check Out">
                                    <ItemTemplate>
                                        <asp:Label ID="CheckOutLabel" runat="server" Text='<%# GetCheckDates(Eval("CheckOutFrom","{0:d}"), Eval("CheckOutTo","{0:d}")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="InvDocStateDesc" HeaderText="State" SortExpression="InvDocState" >
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                            <div style="width:1000px">
                                No proformas found for search criteria. Try change filters.
                            </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsFilteredProforma" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataGroup" 
        TypeName="dsProformaSearchTableAdapters.ProformaSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ddlStates" Name="State" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

