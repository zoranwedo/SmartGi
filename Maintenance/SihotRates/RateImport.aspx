<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotRates/RateSihot.master" AutoEventWireup="false" 
    CodeFile="RateImport.aspx.vb" Inherits="Maintenance_SihotRates_RateImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Rate Import 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbServiceLog" runat="server" Text="Import Queue" SkinID="skGridLabel" ToolTip="Rate files that are not imported on last import process run." />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvImported" runat="server" DataSourceID="dsImported" DataKeyNames="importUID"
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:BoundField DataField="importUID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="importState" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="filePath" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="fileID" ReadOnly="True" Visible="False" />
                            <%--
                            <asp:TemplateField HeaderText="Hotel Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("hotelCode") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("hotelCode") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            --%>
                            <asp:TemplateField HeaderText="File Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fileDate", "{0:d}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("fileDate", "{0:d}") %>' style="color: Red;text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Checked">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("lastChecked") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastChecked") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("fileExpected") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("fileExpected") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/cancel_big.gif"
                                        OnClientClick="return confirm('Canceling import can cause rates not being imported.');" 
                                        ToolTip="Cancel import" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" 
                                        CommandName="CancelImport" ImageUrl="~/Images/accept_red.png"  
                                        CommandArgument='<%# Eval("importUID") %>'
                                        OnClientClick="return confirm('Are you sure you want to cancel this import?');"
                                        ToolTip="Proceed with cancelation" />
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/delete_green.png" 
                                        ToolTip="Revoke cancelation" />
                                </EditItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Import" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibImport" runat="server" CausesValidation="False" 
                                        CommandName="Import" ImageUrl="~/Images/ArtDown.gif"
                                        CommandArgument='<%# Eval("importUID") %>'
                                        OnClientClick="return confirm('Import this file?');" 
                                        ToolTip="Import selected rate file." />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    &nbsp;
                                </EditItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="45px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 760px; height: 30px;" >
                                All rate files are imported.
                            </div> 
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <div style="text-align: right; padding-top: 5px;">
                        <asp:Button ID="btImportAll" runat="server" Text="Import All" SkinID="skBtnBase" 
                            OnClientClick="return confirm('Import all files from queue?');" 
                            ToolTip="Import all files from import queue." />
                    </div> 
                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label5" runat="server" Text="Import From File" SkinID="skGridLabel" ToolTip="Import rate file." />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" >
                    <asp:FileUpload ID="FileImport" runat="server" CssClass="TextBox" Width="854px" />
                    <br />
                    <asp:TabContainer ID="tabImported" runat="server" ActiveTabIndex="0" >
                        <asp:TabPanel ID="tpContracts" runat="server" HeaderText="Contracts" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvCtr" runat="server" AutoGenerateColumns="False" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="lblChanged" HeaderText="Operation" >
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Eval("ContractID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contract">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Bind("RateCodeID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Bind("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="Finish" 
                                            DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Imported From">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FILEID") %>' ToolTip="FILEID" Width="30px" />|
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("pkg_OBJID") %>' ToolTip="PACKAGE.OBJID" Width="30px" />|
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("TourOpID") %>' ToolTip="TourOpID" Width="40px" />|
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("HotelID") %>' ToolTip="HotelID" Width="30px" />|
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("pkg_SEASON") %>' ToolTip="RATE.SEASON_TEXT" Width="70px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImportMsg" HeaderText="Import Message" >
                                            <ItemStyle Width="250px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Font-Names="Calibri" /> 
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tpFreeRates" runat="server" HeaderText="Free-rate Specials" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvFrs" runat="server" AutoGenerateColumns="False" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="lblChanged" HeaderText="Operation" >
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Eval("SpecialID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Special">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Bind("RateCodeID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Bind("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="300px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="Finish" 
                                            DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <%--
                                        <asp:BoundField DataField="BkStart" HeaderText="Bk.Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkFinish" HeaderText="Bk.Finish" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PrDiscount" HeaderText="Discount" DataFormatString="{0:N}" >
                                            <ItemStyle Width="40px" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="%" Visible='<%# Eval("PrDiscountTypeId")=1 %>' />
                                                <asp:Label ID="Label2" runat="server" Text="$" Visible='<%# Eval("PrDiscountTypeId")=2 %>' />
                                                <asp:Label ID="Label3" runat="server" Text='<%# "DiscountType=" & Eval("PrDiscountTypeId") %>' Visible='<%# Eval("PrDiscountTypeId")>2 %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        --%>
                                        <asp:TemplateField HeaderText="Imported From">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FILEID") %>' ToolTip="FILEID" Width="30px" />|
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("pkg_OBJID") %>' ToolTip="PACKAGE.OBJID" Width="30px" />|
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("HotelID") %>' ToolTip="HotelID" Width="30px" />|
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pkg_SEASON") %>' ToolTip="RATE.SEASON_TEXT" Width="70px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="200px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImportMsg" HeaderText="Import Message" >
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Font-Names="Calibri" /> 
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tpSpecials" runat="server" HeaderText="Specials" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvSpo" runat="server" AutoGenerateColumns="False" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="lblChanged" HeaderText="Operation" >
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Eval("SpecialID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Special">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Bind("RateCodeID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Bind("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="300px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="Finish" 
                                            DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkStart" HeaderText="Bk.Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkFinish" HeaderText="Bk.Finish" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PrDiscount" HeaderText="Discount" DataFormatString="{0:N}" >
                                            <ItemStyle Width="40px" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="%" Visible='<%# Eval("PrDiscountTypeId")=1 %>' />
                                                <asp:Label ID="Label2" runat="server" Text="$" Visible='<%# Eval("PrDiscountTypeId")=2 %>' />
                                                <asp:Label ID="Label3" runat="server" Text='<%# "DiscountType=" & Eval("PrDiscountTypeId") %>' Visible='<%# Eval("PrDiscountTypeId")>2 %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Imported From">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FILEID") %>' ToolTip="FILEID" Width="30px" />|
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("spo_OBJID") %>' ToolTip="RATE-SCHEME.OBJID" Width="30px" />|
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("spr_OBJID") %>' ToolTip="RULE.OBJID" Width="30px" />|
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("HotelID") %>' ToolTip="HotelID" Width="30px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImportMsg" HeaderText="Import Message" >
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Font-Names="Calibri" /> 
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tpGeneral" runat="server" HeaderText="Supplements" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvSupp" runat="server"  AutoGenerateColumns="False" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="lblChanged" HeaderText="Operation" >
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# Eval("SupplementID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Supplement">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# "SUPP" & Eval("SupplementID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="350px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="Finish" 
                                            DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkStart" HeaderText="Bk.Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkFinish" HeaderText="Bk.Finish" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RateA" HeaderText="Discount" DataFormatString="{0:N}" >
                                            <ItemStyle Width="40px" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Iif(Eval("IsPercent"),"%","$") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Imported From">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FILEID") %>' ToolTip="FILEID" Width="30px" />|
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sup_OBJID") %>' ToolTip="ADDITIONAL-SPECIAL.OBJID" Width="30px" />|
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("sur_OBJID") %>' ToolTip="RULE.OBJID" Width="30px" />|
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("HotelID") %>' ToolTip="HotelID" Width="30px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImportMsg" HeaderText="Import Message" >
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Font-Names="Calibri" /> 
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tpCharging" runat="server" HeaderText="Charging Supplements" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvChgSupp" runat="server"  AutoGenerateColumns="False" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="lblChanged" HeaderText="Operation" >
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# Eval("SupplementID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Supplement">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# "SUPP" & Eval("SupplementID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>' 
                                                    Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="350px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="Finish" 
                                            DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkStart" HeaderText="Bk.Start" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkFinish" HeaderText="Bk.Finish" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RateA" HeaderText="Discount" DataFormatString="{0:N}" >
                                            <ItemStyle Width="40px" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Iif(Eval("IsPercent"),"%","$") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Imported From">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FILEID") %>' ToolTip="FILEID" Width="30px" />|
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sup_OBJID") %>' ToolTip="OFFER.OBJID" Width="30px" />|
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("sur_OBJID") %>' ToolTip="PACKAGE.OBJID" Width="30px" />|
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("HotelID") %>' ToolTip="HotelID" Width="30px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ImportMsg" HeaderText="Import Message" >
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Font-Names="Calibri" /> 
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                    
                    <div style="text-align: right; padding-top: 5px; width: 855px;">
                        <asp:Button ID="btImportFile" runat="server" Text="Import File" SkinID="skBtnBase" 
                            OnClientClick="return confirm('Import selected file?');" />
                        <asp:Button ID="btDone" runat="server" Text="Done" SkinID="skBtnBase" Visible="false" />
                    </div> 
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsSIHOTTableAdapters.RateQueueTableAdapter" 
        SelectMethod="GetForImport" >
    </asp:ObjectDataSource>
                
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
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
</asp:Content>

