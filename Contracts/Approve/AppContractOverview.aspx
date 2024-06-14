<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Approve/masterAppContracts.master"
    AutoEventWireup="false" CodeFile="AppContractOverview.aspx.vb" Inherits="Contracts_Approve_AppContractOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contract Overview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td style="vertical-align: top;" colspan="2">
                    <asp:DetailsView ID="gvCtr" runat="server" AutoGenerateRows="False" DataSourceID="dsOvwCtr"
                        SkinID="skDetailView" Width="540px" EnableModelValidation="True">
                        <FieldHeaderStyle Width="100px" />
                        <Fields>
                            <asp:TemplateField HeaderText="ContractID" SortExpression="ContractID" 
                                ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ContractID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("ContractID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTitle1" runat="server" Style="text-align: right;" 
                                        Text='<%# "[" & Eval("ContractID") & "]" %>' Width="110px"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="lblTitle21" runat="server" Font-Bold="true" 
                                        Text='<%# Eval("Title") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="GridRow2B" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rate Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("RateCodeId") & " (" & Eval("RateTypeId") & ")" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BaseRate" HeaderText="BaseRate" />
                            <asp:BoundField DataField="BkStart" HeaderText="BkStart" />
                            <asp:BoundField DataField="BkFinish" HeaderText="BkFinish" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="ContractState" HeaderText="State" />
                            <asp:TemplateField HeaderText="Room">
                                <ItemTemplate>
                                    <asp:GridView ID="gvCtrRateOpt" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="dsOvwCtrRateOpt" SkinID="skGridView" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room">
                                            <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="MealPlanId" HeaderText="Meal Plan">
                                            <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="roPerPax" ReadOnly="True">
                                            <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:TemplateField></asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Periods">
                                <ItemTemplate>
                                    <asp:GridView ID="gvCtrPeriod" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="CtrPeriodID" DataSourceID="OvwCtrPeriod" SkinID="skGridView" 
                                        Width="80%">
                                        <Columns>
                                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start">
                                            <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End">
                                            <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:TemplateField></asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <br />
        <asp:ObjectDataSource ID="dsOvwCtr" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByID" 
            TypeName="dsApproveContractTableAdapters.cpFilterUserContractTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="UserName" Type="String" 
                    DefaultValue="Membership.GetUser.UserName" />
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsOvwCtrRateOpt" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsCtrPrevTableAdapters.OvwContractRateOptionTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="OvwCtrPeriod" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsCtrPrevTableAdapters.OvwContractPeriodTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
