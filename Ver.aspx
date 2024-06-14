<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="Ver.aspx.vb" Inherits="Ver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Version
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <asp:DetailsView ID="dvVersion" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="SmartID" DataSourceID="dsVersion" 
        SkinID="skDetailView">
        <Fields>
            <asp:BoundField DataField="SmartID" HeaderText="SmartID" ReadOnly="True" 
                SortExpression="SmartID" />
            <asp:BoundField DataField="SmartVer" HeaderText="SmartVer" 
                SortExpression="SmartVer" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="dsVersion" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsVersionTableAdapters._VersionTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

