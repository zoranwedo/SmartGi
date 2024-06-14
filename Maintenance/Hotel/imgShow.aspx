<%@ Page Language="VB" AutoEventWireup="false" CodeFile="imgShow.aspx.vb" Inherits="Maintenance_Hotel_imgShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="dsHotelLogo" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByHotelID" 
            TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" 
            UpdateMethod="UpdateLogo">
            <DeleteParameters>
                <asp:QueryStringParameter Name="Original_HotelID" QueryStringField="HotelID" 
                    Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Logo" Type="Object" />
                <asp:QueryStringParameter Name="Original_HotelID" QueryStringField="HotelID" 
                    Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
