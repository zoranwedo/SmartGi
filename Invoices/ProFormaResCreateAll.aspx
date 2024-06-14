<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProFormaResCreateAll.aspx.vb" Inherits="Invoices_ProFormaResCreateAll" 
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Create ProForma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <script type="text/javascript">
        function CheckAll(ck) {
            var gridView = document.getElementById('<%= gvReservations.ClientID %>');
            var ckList = gridView.getElementsByTagName('input');
            var l = ckList.length;

            for (var i = 0; i < l; i++) {
                if (ckList[i].type == 'checkbox' && ckList[i].id.indexOf('cbSelected') > -1) {
                    ckList[i].checked = !ckList[i].disabled && ck.checked;
                }
            }
        }

        function CreateClick(bt) {
            bt.style.display = "none";
            //var img = document.getElementById('<%= imgWait.ClientID %>');
            //img.style.display = "inline";
            document.getElementById('<%= imgWait.ClientID %>').style.display = "inline";
            document.getElementById('<%= btFilter.ClientID %>').style.disabled = "true";
            document.getElementById('<%= btClear.ClientID %>').style.disabled = "true";
        }

        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>

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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="btFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr style="width: 600px;">
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="true"
                                        Mandatory="true"
                                        NoCCI="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px"
                                        CollapsedDefailt="true"
                                        FixKind="FixSingle"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Check Out</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Booking</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlBooking" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Bk Number
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtBkNum" runat="server" TargetControlID="txtBkNum"
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Booking Number..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    Group Code
                                </td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="txtResGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtResGroup" runat="server" TargetControlID="txtResGroup"
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Group Code..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:CheckBox ID="cbOnProforma" runat="server" Text="On Proforma" TextAlign="Left" />&nbsp;
                                    <asp:Button ID="btFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
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
        <asp:Panel runat="server" ID="pnlCnt" Visible="false">
            <div class="Red">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <a name="Top" href="#Bottom" style="float: right;"><img src="../Images/Expand.gif" style="padding: 5px 5px 0px 0px;" alt="bottom" /></a>
                            <asp:Label ID="Label2" runat="server" SkinID="skGridLabel" Text="PreInvoices" />
                       </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" >
                            <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilteredReservation"
                                SkinID="skGridView" DataKeyNames="PreInvID,ResID"
                                AllowSorting="True" EnableModelValidation="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" Checked="true" ToolTip="Select All" OnClick="CheckAll(this)" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSelected" runat="server" Checked='<%# not Eval("OnProForma") %>' Enabled='<%# not Eval("OnProForma") %>' />
                                            <asp:HiddenField ID="hbPreInvID" runat="server" Value='<%# Eval("PreInvID") %>' />
                                            <asp:HiddenField ID="hbResID" runat="server" Value='<%# Eval("ResID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="40px" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FolioFull" HeaderText="FolioFull" SortExpression="FolioFull">
                                        <ItemStyle Width="140px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="On PF" SortExpression="OnProForma">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbOnPF" runat="server" Checked='<%# Eval("OnProForma") %>' Enabled="False" />
                                        </ItemTemplate>
                                        <ItemStyle Width="40px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ResSource" HeaderText="Source" SortExpression="ResSource">
                                        <ItemStyle Width="45px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BkNumber" HeaderText="BkNumber" SortExpression="BkNumber">
                                        <ItemStyle Width="90px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="BkDate" SortExpression="BkDate">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BkDate", "{0:d}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="CheckIn" SortExpression="CheckIn">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CheckOut" SortExpression="CheckOut">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("CheckOut", "{0:d}") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Nights" HeaderText="Ngt" SortExpression="Nights">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Adult" HeaderText="Ad" SortExpression="Adult">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Junior" HeaderText="Jn" SortExpression="Junior">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Child" HeaderText="Ch" SortExpression="Child">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Infant" HeaderText="Inf" SortExpression="Infant">
                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Rooms" HeaderText="Rooms" SortExpression="Rooms">
                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PreInvText" HeaderText="Guest" SortExpression="PreInvText">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <div  style="height: 25px; padding-top: 10px">
                                <a name="Bottom" href="#Top" ><img src="../Images/Collapse.gif" alt="top" /></a>
                                <asp:Button ID="btCreate" runat="server" SkinID="skBtnClear" Text="Create Proformas" style="float: right;" OnClientClick="CreateClick(this)" />
                                <asp:Label ID="lblWaiting" runat="server" style="float: right; padding: 1px 5px; border: solid 1px; display: none;">
                                    <asp:Image ID="imgWait" runat="server"  src="../Images/status_anim.gif"/>
                                    <b>Creating Proformas ...</b>
                                </asp:Label>
                            </div>
                       </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:ObjectDataSource ID="dsFilteredReservation" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsPreInvoicesTableAdapters.FilterUserGroupPreInvoiceTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="UserName" Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckOut" Name="ChkOutFrom" PropertyName="DateFrom" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckOut" Name="ChkOutTo" PropertyName="DateTo" Type="DateTime" />
                <asp:ControlParameter ControlID="txtResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ctrlBooking" Name="BkDateFrom" PropertyName="DateFrom" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlBooking" Name="BkDateTo" PropertyName="DateTo" Type="DateTime" />
                <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondId" PropertyName="SelectedPayCond" Type="String" />
                <asp:ControlParameter ControlID="cbOnProforma" Name="OnProForma" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            CancelControlID="btnNo" OkControlID="btnYes" DropShadow="True" Enabled="True"
            BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
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
    </div>
</asp:Content>
