<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InvoiceDetail.aspx.vb" Inherits="Reports_Invoices_InvoiceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource runat="server" 
            ID="dsRptInvoice"  
            TypeName="ReportsInvoiceTableAdapters.Invoice_PrintTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" 
            ID="dsInvoiceDetail" 
            TypeName="ReportsInvoiceTableAdapters.InvoiceDetail_PrintTableAdapter"
            SelectMethod="GetData_GB" >
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                <asp:QueryStringParameter Name="GrossBilling" QueryStringField="GrossBilling" Type="Boolean" DefaultValue="false" />
                <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" 
            ID="dsInvoiceItem" 
            TypeName="ReportsInvoiceTableAdapters.InvoiceItemTableAdapter"
            SelectMethod="GetData_GB" OldValuesParameterFormatString="original_{0}" >
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                <asp:QueryStringParameter Name="GrossBilling" QueryStringField="GrossBilling" Type="Boolean" DefaultValue="false" />
                <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" 
            ID="dsInvoiceComment" 
            TypeName="dsInvoicesTableAdapters.InvoiceCommentTableAdapter"
            SelectMethod="GetInvComment" 
            OldValuesParameterFormatString="original_{0}" >
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" 
            ID="dsCM" 
            TypeName="dsCoopMarketingTableAdapters.Invoice_Print_CMTableAdapter"
            SelectMethod="GetData_GB" 
            OldValuesParameterFormatString="original_{0}" >
            <SelectParameters>
                <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                <asp:QueryStringParameter Name="GrossBilling" QueryStringField="GrossBilling" Type="Boolean" DefaultValue="false" />
                <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
