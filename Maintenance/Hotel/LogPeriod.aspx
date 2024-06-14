<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="LogPeriod.aspx.vb" Inherits="Maintenance_Hotel_LogPeriod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <p>
        Hotel Period&#39;s Log</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:ObjectDataSource ID="dsHotels" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByFilter" 
        TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HotelHID" Type="String" />
            <asp:Parameter Name="Hotel" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankAccount" Type="String" />
            <asp:Parameter Name="Rooms" Type="Int32" />
            <asp:Parameter Name="Htl_Titulo" Type="String" />
            <asp:Parameter Name="AdultOnly" Type="Boolean" />
            <asp:Parameter Name="Flat" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Logo" Type="Object" />
            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUserName" Name="UserName" PropertyName="Value" Type="String" />
            <asp:Parameter Name="Hotel" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Country" Type="String" DefaultValue="" />
            <asp:Parameter DefaultValue="True" Name="ActiveOnly" Type="Boolean" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="HotelID" Type="Int32" />
            <asp:Parameter Name="HotelHID" Type="String" />
            <asp:Parameter Name="Hotel" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankAccount" Type="String" />
            <asp:Parameter Name="Rooms" Type="Int32" />
            <asp:Parameter Name="Htl_Titulo" Type="String" />
            <asp:Parameter Name="AdultOnly" Type="Boolean" />
            <asp:Parameter Name="Flat" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Logo" Type="Object" />
            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Hotel Period’s Log" 
                        SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td style="width: 280px;">
                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True"
                        DataSourceID="dsHotels" DataTextField="Hotel" DataValueField="HotelID" 
                        CssClass="TextBox" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotelPeriod" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="HotelID,PeriodYear,PeriodMonth" DataSourceID="dsHotelPeriod" 
                        SkinID="skGridView" Width="500px" >
                        <Columns>
                            <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" SortExpression="HotelID"
                                Visible="False" />
                            <asp:BoundField DataField="PeriodYear" HeaderText="Year" ReadOnly="True" 
                                SortExpression="PeriodYear" >
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PeriodMonth" HeaderText="Month" ReadOnly="True"
                                SortExpression="PeriodMonth" >
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Closed" HeaderText="Closed" 
                                SortExpression="Closed" >
                            <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="DateClosed" DataFormatString="{0:d}" HeaderText="Closed On"
                                HtmlEncode="False" SortExpression="DateClosed" ReadOnly="True" >
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UserClosed" HeaderText="UserClosed" SortExpression="UserClosed"
                                ReadOnly="True" Visible="False" />
                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/decline_inline.gif"
                                EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" 
                                UpdateImageUrl="~/Images/accept_inline.gif" >
                            <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="return confirm('Are you sure you want to delete the record')" 
                                        Text="Delete" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="GridRow2B" HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newPeriod" runat="server" DataSourceID="dsHotelPeriod" 
                        Width="495px">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow2B">
                                    <td style="width: 90px;">
                                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnDataBound="ddlYear_DataBound"
                                            SelectedValue='<%# Bind("PeriodYear") %>' CssClass="TextBox">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 120px;">
                                        <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" 
                                            SelectedValue='<%# Bind("PeriodMonth") %>' CssClass="TextBox">
                                            <asp:ListItem Value="1">January</asp:ListItem>
                                            <asp:ListItem Value="2">February</asp:ListItem>
                                            <asp:ListItem Value="3">March</asp:ListItem>
                                            <asp:ListItem Value="4">April</asp:ListItem>
                                            <asp:ListItem Value="5">May</asp:ListItem>
                                            <asp:ListItem Value="6">June</asp:ListItem>
                                            <asp:ListItem Value="7">July</asp:ListItem>
                                            <asp:ListItem Value="8">August</asp:ListItem>
                                            <asp:ListItem Value="9">September</asp:ListItem>
                                            <asp:ListItem Value="10">October</asp:ListItem>
                                            <asp:ListItem Value="11">November</asp:ListItem>
                                            <asp:ListItem Value="12">December</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 244px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 50px; height: 30px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 405px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 210px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsHotelPeriod" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID"
        TypeName="UserTableAdapters.PeriodTableAdapter" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlHotels" Name="HotelID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlHotels" Name="HotelID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:Parameter Name="PeriodYear" Type="Int32" />
            <asp:Parameter DefaultValue="" Name="PeriodMonth" Type="Int32" />
            <asp:Parameter DefaultValue="False" Name="Closed" Type="Boolean" />
            <asp:Parameter DefaultValue="" Name="DateClosed" Type="DateTime" />
            <asp:Parameter Name="UserClosed" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
            <asp:Parameter Name="Original_PeriodYear" Type="Int32" />
            <asp:Parameter Name="Original_PeriodMonth" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="" Name="Closed" Type="Boolean" />
            <asp:Parameter DefaultValue="" Name="DateClosed" Type="DateTime" />
            <asp:Parameter Name="UserClosed" Type="String" />
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
            <asp:Parameter Name="Original_PeriodYear" Type="Int32" />
            <asp:Parameter Name="Original_PeriodMonth" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblError" runat="server" SkinID="ErrorLabel" Width="550px"></asp:Label>
</asp:Content>
