<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProInvoiceDetail.aspx.vb" Inherits="Reports_Invoices_ProInvoiceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                <asp:ObjectDataSource ID="dsRptInvoice" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="ReportsInvoiceTableAdapters.Invoice_PrintTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" 
                            Type="Int32" />
                        <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" 
                            Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvoiceDetail" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    
            TypeName="ReportsInvoiceTableAdapters.InvoiceDetail_PrintTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" 
                            Type="Int32" />
                        <asp:QueryStringParameter Name="HRate" QueryStringField="HotelChecked" 
                            Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
