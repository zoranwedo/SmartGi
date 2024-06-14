<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ImportTest.aspx.vb" Inherits="Maintenance_SihotRates_ImportTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Rates Import Prototype
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
    <asp:Button ID="Button2" runat="server" Text="Delete All" SkinID="skBtnBase" Width="100px" />
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="TextBox" Width="700px" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Import" SkinID="skBtnBase" Width="100px" />
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" Width="700px"/>
    <asp:Button ID="Button3" runat="server" Text="Check Import" SkinID="skBtnBase" Width="100px" />
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" >
        <asp:TabPanel ID="tpComment" runat="server" HeaderText="Contracts" style="float: left;" >
            <ContentTemplate>
                <asp:GridView ID="gvCtr" runat="server" AutoGenerateColumns="False" SkinID="skGridView" GridLines="Both" >
                    <Columns>
                        <asp:BoundField DataField="lblChanged" HeaderText="Changed" />
                        <asp:BoundField DataField="FILEID" HeaderText="FILEID" />
                        <asp:BoundField DataField="pkg_OBJID" HeaderText="pkg_OBJID" />
                        <asp:BoundField DataField="ContractID" HeaderText="ContractID" />
                        <asp:BoundField DataField="TourOpID" HeaderText="TourOpID" />
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" />
                        <asp:BoundField DataField="RateCodeID" HeaderText="RateCodeID" />
                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" />
                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="ImportMsg" HeaderText="ImportMsg" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Specials" style="float: left;" >
            <ContentTemplate>
                <asp:GridView ID="gvSpo" runat="server" AutoGenerateColumns="False" SkinID="skGridView" GridLines="Both" >
                    <Columns>
                        <asp:BoundField DataField="lblChanged" HeaderText="Changed" />
                        <asp:BoundField DataField="FILEID" HeaderText="FILEID" />
                        <asp:BoundField DataField="spo_OBJID" HeaderText="spo_OBJID" />
                        <asp:BoundField DataField="spr_OBJID" HeaderText="spr_OBJID" />
                        <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" />
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" />
                        <asp:BoundField DataField="RateCodeID" HeaderText="RateCodeID" />
                        <asp:BoundField DataField="BookingCode" HeaderText="BookingCode" />
                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" />
                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" />
                        <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="BkStart" />
                        <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="BkFinish" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="PrDiscount" HeaderText="PrDiscount" DataFormatString="{0:N2}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="%" Visible='<%# Eval("PrDiscountTypeId")=1 %>' />
                                <asp:Label ID="Label2" runat="server" Text="$" Visible='<%# Eval("PrDiscountTypeId")=2 %>' />
                                <asp:Label ID="Label3" runat="server" Text='<%# "DiscountType=" & Eval("PrDiscountTypeId") %>' Visible='<%# Eval("PrDiscountTypeId")>2 %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ImportMsg" HeaderText="ImportMsg" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Supplements" style="float: left;" >
            <ContentTemplate>
                <asp:GridView ID="gvSupp" runat="server"  AutoGenerateColumns="False" SkinID="skGridView" GridLines="Both" >
                    <Columns>
                        <asp:BoundField DataField="lblChanged" HeaderText="Changed" />
                        <asp:BoundField DataField="FILEID" HeaderText="FILEID" />
                        <asp:BoundField DataField="sup_OBJID" HeaderText="spo_OBJID" />
                        <asp:BoundField DataField="sur_OBJID" HeaderText="spr_OBJID" />
                        <asp:BoundField DataField="SupplementID" HeaderText="SpecialID" />
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" />
                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" />
                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" />
                        <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="BkStart" />
                        <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="BkFinish" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="RateA" HeaderText="PrDiscount" DataFormatString="{0:N2}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Iif(Eval("IsPercent"),"%","$") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ImportMsg" HeaderText="ImportMsg" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Charging Supplements" style="float: left;" >
            <ContentTemplate>
                <asp:GridView ID="gvChgSupp" runat="server"  AutoGenerateColumns="False" SkinID="skGridView" GridLines="Both" >
                    <Columns>
                        <asp:BoundField DataField="lblChanged" HeaderText="Changed" />
                        <asp:BoundField DataField="FILEID" HeaderText="FILEID" />
                        <asp:BoundField DataField="sup_OBJID" HeaderText="spo_OBJID" />
                        <asp:BoundField DataField="sur_OBJID" HeaderText="spr_OBJID" />
                        <asp:BoundField DataField="SupplementID" HeaderText="SpecialID" />
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" />
                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" />
                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" />
                        <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="BkStart" />
                        <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="BkFinish" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="RateA" HeaderText="PrDiscount" DataFormatString="{0:N2}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Iif(Eval("IsPercent"),"%","$") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ImportMsg" HeaderText="ImportMsg" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    </div>
</asp:Content>

