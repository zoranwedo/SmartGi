<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    GI SMART Portal
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
    <asp:Panel ID="Panel1" runat="server" >
        <%--<asp:TabContainer ID="tabSanity" runat="server" ActiveTabIndex="0" AutoPostBack="False" CssClass="Tab" >
            <asp:TabPanel ID="tpHotelNotMap" runat="server" HeaderText="Not Mapped In Smart" 
                ToolTip="Hotel room types that are not mapped in smart (from last 7 days reservations import log)">
                <ContentTemplate >
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 300px;" >
                                Hotel room types that are not mapped in smart <br />
                                (from last 7 days reservations import log)
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">

                                <asp:GridView ID="gvHotelNotMap" runat="server" AutoGenerateColumns="False" AllowSorting="false" 
                                    DataSourceID="dsHotelMap" EnableModelValidation="True" SkinID="skGridView" >
                                    <Columns>
                                        <asp:BoundField DataField="HotelHID" HeaderText="Hotel" SortExpression="HotelHID" >
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RoomTypeHID" HeaderText="Room Type" SortExpression="RoomTypeHID" >
                                            <ItemStyle Width="250px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        All hotel room types mapped in smart
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsHotelMap" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="dsSanityTableAdapters.HotelRoomsNotMappedTableAdapter">
                                </asp:ObjectDataSource>
        
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tpSmartNoMap" runat="server" HeaderText="Not Mapped To Hotel" 
                ToolTip="Smart room types that don't have mapping to hotels">
                <ContentTemplate >
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 700px;" >
                                Smart room types that don't have mapping to hotels
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">

                                <asp:GridView ID="gvSmartNotMap" runat="server" AutoGenerateColumns="False" AllowSorting="false" 
                                    DataSourceID="dsSmartMap" EnableModelValidation="True" SkinID="skGridView" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# "(" & Eval("HotelID") & ")" %>' Width="30px"/>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Hotel") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="400px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Room Type" SortExpression="RoomTypeID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("RoomTypeID") %>' Width="50px"/>
                                                <asp:Label ID="Label4" runat="server" Text='<%# "(" & Eval("RoomType") & ")" %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="300px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>All Smart room types have mapping to hotels</EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsSmartMap" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="dsSanityTableAdapters.SmartRoomsNotMappedTableAdapter">
                                </asp:ObjectDataSource>

                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tpSmartMultiMap" runat="server" HeaderText="Multiple Mappings"  
                ToolTip="Hotel room types that are mapped to more than one Smart's">
                <ContentTemplate >
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 600px;" >
                                Hotel room types that are mapped to more than one Smart's
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">

                                <asp:GridView ID="gvSmartMultiMap" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="dsSmartMultiMap" EnableModelValidation="True" SkinID="skGridView" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hotel Room Type" SortExpression="HotelHID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("HotelHID") %>' />
                                                &nbsp;\&nbsp;
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoomTypeHID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Smart Room Type" SortExpression="HotelID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# "(" & Eval("HotelID") & ")" %>' Width="30px" />
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Hotel") %>' />
                                                &nbsp;\&nbsp;
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("RoomTypeID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="500px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No hotel room types are mapped to more than one Smart's
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsSmartMultiMap" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                    TypeName="dsSanityTableAdapters.SmartMultiMapTableAdapter">
                                </asp:ObjectDataSource>

                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>--%>
    </asp:Panel>
    </div>
</asp:Content>

