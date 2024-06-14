<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Overview.aspx.vb" Inherits="Contracts_Wizard_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Overview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
     <table cellpadding="0" cellspacing="0">
       <tr>
        <td style="padding-bottom: 5px;">
            <asp:Button ID="linkNew" runat="server" Text="Print Rate Sheet" SkinID="skBtnBase" />
            <%--<asp:HiddenField ID="hfUsername" runat="server" />--%>
        
        
        
        </td>
       </tr>
       <tr>
        <td>
        <asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" DataKeyNames="ContractRateID"
            DataSourceID="dsRates" SkinID="skGridView" ShowHeader="False"
                EnableModelValidation="True">
            <RowStyle HorizontalAlign="Right" />
            <Columns>
                <asp:TemplateField HeaderText="RoomTypeId">
                    <ItemTemplate>
                        <asp:Label ID="lblRoomID" runat="server" Text='<%# Eval("RoomTypeId") %>' />&nbsp;
                        [<asp:Label ID="lblRoom" runat="server" Font-Italic="true" Text='<%# Eval("RoomType") %>' />]
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RateCodeId">
                    <ItemTemplate>
                        <asp:Label ID="lblRateCode" runat="server" Text='<%# Bind("RateCodeId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MealPlanId">
                    <ItemTemplate>
                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Bind("MealPlanId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Start" HeaderText="Start" DataFormatString="{0:d}">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Finish" HeaderText="End" DataFormatString="{0:d}">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Desctiption" HeaderText="Note" SortExpression="Desctiption">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" Wrap="True" Font-Size="X-Small" Width="400px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax1" HeaderText="Single" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax2" HeaderText="Double" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax3" HeaderText="Triple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax4" HeaderText="Quadriple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax5" HeaderText="Quintuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax6" HeaderText="Sextuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax7" HeaderText="Setuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax8" HeaderText="Octuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax9" HeaderText="Nonuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePax10" HeaderText="Decuple" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RatePaxEx" DataFormatString="{0:N2}" HeaderText="RatePaxEx"
                    NullDisplayText="-" SortExpression="RatePaxEx">
                    <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld1" HeaderText="Chld1" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld2" HeaderText="Chld2" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld3" HeaderText="Chld3" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="RateChld4" HeaderText="Chld4" DataFormatString="{0:N2}">
                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblPerPax" runat="server" Text="PerPax" Visible='<%# Eval("PerPax")=True %>' />
                        <asp:Label ID="lblPerRoom" runat="server" Text="PerRoom" Visible='<%# Eval("PerPax")=False %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblPerArrival" runat="server" Text="PerArrival" Visible='<%# Eval("RateOption")=0 %>' />
                        <asp:Label ID="lblPerStay" runat="server" Text="PerStay" Visible='<%# Eval("RateOption")=1 %>' />
                        <asp:Label ID="lblInclusiv" runat="server" Text="Inclusiv" Visible='<%# Eval("RateOption")=2 %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Allotment" HeaderText="Allotment" DataFormatString="{0:N0}">
                    <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="CutOff" HeaderText="CutOff" DataFormatString="{0:N0}">
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
       </td>
      </tr>
     </table> 
        <asp:ObjectDataSource ID="dsRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsCtrPrevTableAdapters.ContractRateTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ContractID" DataSourceID="dsChildren">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="Chld1LabelLabel" runat="server" Text='<%# Bind("Chld1Label") %>' />&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld1ShLabelLabel" runat="server" Text='<%# "(" & Eval("Chld1ShLabel") & "):" %>' 
                                Visible='<%# Eval("Chld1ShLabel") isnot DBNull.Value %>' />&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld1AgLabelLabel" runat="server" Text='<%# Bind("Chld1AgLabel") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Chld2LabelLabel" runat="server" Text='<%# Bind("Chld2Label") %>' />&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld2ShLabelLabel" runat="server" Text='<%# "(" & Eval("Chld2ShLabel") & "):" %>' 
                                Visible='<%# Eval("Chld2ShLabel") isnot DBNull.Value %>' />&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld2AgLabelLabel" runat="server" Text='<%# Bind("Chld2AgLabel") %>' />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Chld3LabelLabel" runat="server" Text='<%# Bind("Chld3Label") %>' />&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld3ShLabelLabel" runat="server" Text='<%# "(" & Eval("Chld3ShLabel") & "):" %>' 
                                Visible='<%# Eval("Chld3ShLabel") isnot DBNull.Value %>' />&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld3AgLabelLabel" runat="server" Text='<%# Bind("Chld3AgLabel") %>' />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Chld4LabelLabel" runat="server" Text='<%# Bind("Chld4Label") %>' />&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld4ShLabelLabel" runat="server" Text='<%# "(" & Eval("Chld4ShLabel") & "):" %>' 
                                Visible='<%# Eval("Chld4ShLabel") isnot DBNull.Value %>' />&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Chld4AgLabelLabel" runat="server" Text='<%# Bind("Chld4AgLabel") %>' />&nbsp;
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsChildren" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByContractID" TypeName="ContractsTableAdapters.ContractOccupancyTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntSupp" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" TypeName="CntReportsTableAdapters.RateSupplTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntRates" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByOverview" TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
            <SelectParameters>
                <%--<asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="value" Type="String" DefaultValue="" />--%>
                <asp:Parameter Name="UserName" Type="String" DefaultValue="admin" />
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                <asp:Parameter Name="SpecialId" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
