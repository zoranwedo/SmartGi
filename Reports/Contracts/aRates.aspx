<%@ Page Language="VB" AutoEventWireup="false" CodeFile="aRates.aspx.vb" Inherits="Reports_Contracts_aRates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<asp:ObjectDataSource ID="dsBase" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RateBaseTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsContract" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RSCtrRptTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RateShRateTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsOccup" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RateShOccTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDisc" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.ContractRateFormatTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                <asp:Parameter Name="RoomTypeId" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
