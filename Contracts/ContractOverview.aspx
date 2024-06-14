<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterContracts.master"
    AutoEventWireup="false" CodeFile="ContractOverview.aspx.vb" Inherits="Contracts_ContractOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contract Overview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td class="GridLabelBG" colspan="2">
                    <asp:Label ID="lbDetails" runat="server" Text="Contract details" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="vertical-align: top;" >
                    <asp:DetailsView ID="gvCtr" runat="server" AutoGenerateRows="False" DataSourceID="dsOvwCtr" SkinID="skDetailView" Width="510px">
                        <FieldHeaderStyle Width="110px" />
                        <Fields>
                            <asp:TemplateField HeaderText="ContractID" InsertVisible="False" ShowHeader="False" >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# "[" & Eval("ContractID") & "]" %>' Width="110px" Style="text-align: right;" />&nbsp;
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true"/>
                                </ItemTemplate>
                                <ItemStyle CssClass="GridRow2B"/>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" ReadOnly="true" />
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" ReadOnly="true" />
                            <asp:BoundField DataField="RateTypeId" HeaderText="Rate Type" ReadOnly="true" />
                            <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" ReadOnly="true" />
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" ReadOnly="true" />
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" ReadOnly="true" />
                            <asp:BoundField DataField="Commision" HeaderText="Commision (%)" ReadOnly="true" />
                            <asp:BoundField DataField="ContractState" HeaderText="State" ReadOnly="true" />
                            <%--<asp:TemplateField HeaderText="Contracted Rooms">
                                <ItemTemplate>
                                    <asp:GridView ID="gvCtrRateOpt" runat="server" AutoGenerateColumns="False" DataSourceID="dsOvwCtrRateOpt"
                                        SkinID="skGridView" Width="100%">
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
                                <HeaderStyle VerticalAlign="Top" Width="110px" />
                            </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Contract Periods">
                                <ItemTemplate>
                                    <asp:GridView ID="gvCtrPeriod" runat="server" AutoGenerateColumns="False" DataKeyNames="CtrPeriodID"
                                        DataSourceID="OvwCtrPeriod" SkinID="skGridView" Width="100%">
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
                                <HeaderStyle VerticalAlign="Top" Width="110px" />
                            </asp:TemplateField>--%>
                            
                            <asp:TemplateField HeaderText="Rate Recieved">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRRecived" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' CssClass="TextBox" />
                                    <asp:CalendarExtender ID="txtRRecived_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtRRecived" />
                                    <asp:CompareValidator ID="dateRRecived" runat="server" ControlToValidate="txtRRecived"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="datexRRecived" runat="server" Enabled="True" TargetControlID="dateRRecived" />
                                    <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRRecived" 
                                        Display="None" ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRRecived" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' Height="40px" />
                                    <div style="text-align: right; vertical-align: top;">
                                        <asp:ImageButton ID="ibUpdate" runat="server" CommandName="Update" 
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />  
                                        <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" 
                                            ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" 
                                            CausesValidation="false" />
                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' />
                                    <div style="text-align: right;">
                                        <asp:ImageButton ID="ibEdit" runat="server" CommandName="Edit" 
                                            ImageUrl="~/Images/edit_inline.gif" CssClass="ImgButton" />
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:FormView ID="fvComment" runat="server" DataSourceID="dsOvwComment" >
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td class="SelectRow1B" style="width: 502px">
                                        <asp:Label ID="lblCommentLabel" runat="server" Text='<%# Eval("SihotRateType") & " comment" %>' />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        <asp:Label ID="lblComment" runat="server" Text='<%# Eval("RateComment") %>' />
                                    </td>
                                </tr>
                           </table>
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td class="GridBorder" valign="top" rowspan="2">
                    <table>
                        <tr>
                            <td class="SelectRow1B">
                                <b>Contracted Rooms</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvCtrRateOpt" runat="server" AutoGenerateColumns="False" DataSourceID="dsOvwCtrRateOpt"
                                    SkinID="skGridView" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="RoomTypeId" HeaderText="Room">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MealPlanId" HeaderText="Meal Plan">
                                            <ItemStyle Width="60px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="roPerPax" ReadOnly="True">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:TemplateField></asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td class="SelectRow1B">
                                <b>Contract Periods</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvCtrPeriod" runat="server" AutoGenerateColumns="False" DataKeyNames="CtrPeriodID"
                                    DataSourceID="OvwCtrPeriod" SkinID="skGridView" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:TemplateField></asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                   </table>
                </td>
            </tr>
        </table>
        <br />
        <asp:ObjectDataSource ID="dsOvwCtr" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            UpdateMethod="UpdateQuery"
            TypeName="dsCtrPrevTableAdapters.OvwContractTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <%--<asp:Parameter Name="Original_ContractID" Type="Int32" />--%>
                <asp:QueryStringParameter Name="Original_ContractID" QueryStringField="ContractID" Type="Int32" />
            </UpdateParameters>
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
        <asp:ObjectDataSource ID="dsOvwComment" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsCtrPrevTableAdapters.ContractCommentTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
