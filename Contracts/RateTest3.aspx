<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RateTest3.aspx.vb" Inherits="Contracts_RateTest3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../App_Themes/SmartTheme/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="Blue">
        <asp:Label ID="Label1" runat="server" Text="Contract:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Go..." />
    
        <br />
    
        <asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ContractRateID" DataSourceID="dsRates" SkinID="skGridView" 
            ShowHeader="False">
            <RowStyle HorizontalAlign="Right" />
            <Columns>
                <asp:TemplateField HeaderText="RoomTypeId" >
                    <ItemTemplate>
                        <asp:Label ID="lblRoomID" runat="server" Text='<%# Eval("RoomTypeId") %>' />&nbsp;
                        [<asp:Label ID="lblRoom" runat="server" Font-Italic="true" Text='<%# Eval("RoomType") %>' />]
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RateCodeId" >
                    <ItemTemplate>
                        <asp:Label ID="lblRateCode" runat="server" Text='<%# Bind("RateCodeId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MealPlanId" >
                    <ItemTemplate>
                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Bind("MealPlanId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="Finish" HeaderText="Finish" 
                    DataFormatString="{0:d}" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax1" HeaderText="Pax1" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax2" HeaderText="Pax2" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax3" HeaderText="Pax3" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax4" HeaderText="Pax4" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax5" HeaderText="Pax5" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax6" HeaderText="Pax6" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax7" HeaderText="Pax7" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax8" HeaderText="Pax8" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax9" HeaderText="Pax9" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax10" HeaderText="Pax10" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld1" HeaderText="Chld1" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld2" HeaderText="Chld2" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld3" HeaderText="Chld3" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld4" HeaderText="Chld4" 
                    DataFormatString="{0:N2}" >
                <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Label ID="lblPerPax" runat="server" Text="PerPax" Visible='<%# Eval("PerPax")=True %>' />
                        <asp:Label ID="lblPerRoom" runat="server" Text="PerRoom" Visible='<%# Eval("PerPax")=False %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Label ID="lblPerArrival" runat="server" Text="PerArrival" Visible='<%# Eval("RateOption")=0 %>' />
                        <asp:Label ID="lblPerStay" runat="server" Text="PerStay" Visible='<%# Eval("RateOption")=1 %>' />
                        <asp:Label ID="lblInclusiv" runat="server" Text="Inclusiv" Visible='<%# Eval("RateOption")=2 %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Allotment" HeaderText="Allotment" 
                    DataFormatString="{0:N0}" >
                <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="CutOff" HeaderText="CutOff"  
                    DataFormatString="{0:N0}" >
                <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfExtra" runat="server" Value='<%# Bind("RateExtra") %>' />
                        <asp:HiddenField ID="hfRoccup" runat="server" Value='<%# Bind("MaxROccupancy") %>' />
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:ObjectDataSource ID="dsRates" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsCtrPrevTableAdapters.ContractRateTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ContractId" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
