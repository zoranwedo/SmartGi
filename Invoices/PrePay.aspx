<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="PrePay.aspx.vb" Inherits="Invoices_PrePay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    PrePay
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
 <asp:UpdatePanel runat="server" ID="pnlPop">
                        <ContentTemplate>
    <div class="Blue">
<table cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 25px;">
                            &nbsp;</td>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblOccupancy" runat="server" SkinID="skGridLabel" Text="Pre Pay"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gvPrePay" runat="server" AutoGenerateColumns="False"
                                DataSourceID="dsPrePay" SkinID="skGridView" Width="600px" 
                                DataKeyNames="PrePayID">
                                <Columns>
                                    <asp:BoundField DataField="PrePayID" HeaderText="ID" SortExpression="ID" 
                                        ReadOnly="True" >
                                    <ItemStyle Width="40px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="TourOp" SortExpression="TourOpID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" 
                                                DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID" 
                                                SelectedValue='<%# Bind("TourOpID") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" 
                                                DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID" 
                                                SelectedValue='<%# Bind("TourOpID") %>'>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="200px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hotel" SortExpression="HotelID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                                DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" 
                                                SelectedValue='<%# Bind("HotelID") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                                DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" 
                                                SelectedValue='<%# Bind("HotelID") %>'>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="200px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" SortExpression="PPDate">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PPDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" 
                                                Text='<%# Bind("PPDate", "{0:d}") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" 
                                                TargetControlID="fltStart" WatermarkCssClass="WaterMark" 
                                                WatermarkText="Check In date equal or greater than..." />
                                            <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" 
                                                CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart">
                                            </asp:CalendarExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PPValue" HeaderText="Amount" 
                                        SortExpression="PPValue">
                                        <ControlStyle Width="80px" />
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PPFreeValue" HeaderText="Rest Amn" 
                                        SortExpression="PPFreeValue" ReadOnly="True">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" 
                                        CancelImageUrl="~/Images/decline_inline.gif" 
                                        EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" 
                                        UpdateImageUrl="~/Images/accept_inline.gif" />
                                    <asp:CommandField ButtonType="Image" 
                                        DeleteImageUrl="~/Images/delete_inline.gif" ShowDeleteButton="True" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" 
                                        style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 40px; text-align: left;">
                                             ID
                                            </td>
                                            <td style="width: 140px; text-align: left;">
                                             Tour Operator
                                            </td>
                                            <td style="width: 140px; text-align: left;">
                                             Hotel
                                            </td>
                                            <td style="width: 80px; text-align: left;">
                                             Date
                                            </td>
                                            <td style="width: 80px; text-align: left;">
                                             Value
                                            </td>
                                            <td style="width: 75px; text-align: left;">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <HeaderStyle Wrap="True" />
                            </asp:GridView>
                            <asp:FormView ID="fvPrePay" runat="server" DataKeyNames="PrePayID" 
                                DataSourceID="dsPrePay" Width="600px">
                                <RowStyle HorizontalAlign="Right" />
                                <InsertItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td>
                                                <asp:TextBox ID="AdultTextBox" runat="server" CssClass="TextBox" Text='<%# Eval("PrePayID") %>'
                                                    Width="40px" />
                                                <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" 
                                                    DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID" 
                                                    SelectedValue='<%# Bind("TourOpID") %>' Width="140px">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                                    DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" 
                                                    SelectedValue='<%# Bind("HotelID") %>' Width="140px">
                                                </asp:DropDownList>
                                                <asp:TextBox ID="PPDateTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("PPDate") %>'
                                                    Width="80px" />
                                                <asp:CalendarExtender ID="PPDateTextBox_CalendarExtender" runat="server" 
                                                    CssClass="cal_Theme1" Enabled="True" TargetControlID="PPDateTextBox">
                                                </asp:CalendarExtender>
                                                <asp:TextBox ID="PPValueTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("PPValue") %>'
                                                    Width="80px" />
                                            </td>
                                            <td style="width: 75px; text-align: left;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="height: 30px; width: 580px;">
                                                <asp:Label ID="lblEmpty" runat="server" Width="250px">&nbsp;</asp:Label>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="height: 30px;">
                                                <asp:Label ID="lblEmpty" runat="server" Width="250px">&nbsp;</asp:Label>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsPrePay" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" SelectMethod="GetData"
                                TypeName="ProFormaApliicTableAdapters.PrePayTableAdapter" 
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="gvPrePay" Name="PrePayID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="TourOpID" Type="Int32" />
                                    <asp:Parameter Name="HotelID" Type="Int32" />
                                    <asp:Parameter Name="PPDate" Type="DateTime" />
                                    <asp:Parameter Name="PPValue" Type="Decimal" />
                                    <asp:ControlParameter ControlID="gvPrePay" Name="PrePayID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="PrePayID" Type="Int32" />
                                    <asp:Parameter Name="TourOpID" Type="Int32" />
                                    <asp:Parameter Name="HotelID" Type="Int32" />
                                    <asp:Parameter Name="PPDate" Type="DateTime" />
                                    <asp:Parameter Name="PPValue" Type="Decimal" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsHotel" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                        PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsTO" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                        PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
    </div>
     </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

