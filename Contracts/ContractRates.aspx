<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterContracts.master"
    AutoEventWireup="false" CodeFile="ContractRates.aspx.vb" Inherits="Contracts_ContractRates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contract Rates
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <div class="Blue">
     <table cellpadding="0" cellspacing="0">
       <tr>
        <td style="padding-bottom: 5px;">
            <asp:Button ID="linkNew" runat="server" Text="Print Rate Sheet" SkinID="skBtnBase" />
            <asp:HiddenField ID="hfUsername" runat="server" />
         <div class="Green" style="float: right;">
            <asp:Button ID="btEDS" runat="server" Text="Karisma Layout" SkinID="skBtnBase" />
            <asp:Button ID="btGroup" runat="server" Text="Group Layout" SkinID="skBtnBase" />
         </div>
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

        <asp:ObjectDataSource ID="dsLayoutRates" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsSpecMatrixTableAdapters.ContractLayoutRatesTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="UserName" Type="String" DefaultValue="admin" />
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsLayoutGroupRates" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetContract" 
            TypeName="dsSpecMatrixTableAdapters.LayoutRatesTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="UserName" Type="String" DefaultValue="admin" />
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsLayoutHeader" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsSpecMatrixTableAdapters.ContractLayoutHeaderTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsLayoutHeader" EnableModelValidation="True" Visible="False">
            <Columns>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ContractID" />
                <asp:BoundField DataField="TourOpID" HeaderText="TourOpID" 
                    SortExpression="TourOpID" />
                <asp:BoundField DataField="TourOp" HeaderText="TourOp" 
                    SortExpression="TourOp" />
                <asp:BoundField DataField="BillingName" HeaderText="BillingName" 
                    SortExpression="BillingName" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email1" HeaderText="Email1" 
                    SortExpression="Email1" />
                <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                    SortExpression="HotelId" />
                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsLayoutRates" EnableModelValidation="True" Visible="False">
            <Columns>
                <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" 
                    SortExpression="ContractRateID" />
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" 
                    SortExpression="ContractID" />
                <asp:BoundField DataField="CtrPeriodId" HeaderText="CtrPeriodId" 
                    SortExpression="CtrPeriodId" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Commision" HeaderText="Commision" 
                    SortExpression="Commision" />
                <asp:BoundField DataField="StateId" HeaderText="StateId" 
                    SortExpression="StateId" />
                <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                    SortExpression="HotelId" />
                <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" 
                    SortExpression="TourOpId" />
                <asp:BoundField DataField="MarketId" HeaderText="MarketId" 
                    SortExpression="MarketId" />
                <asp:BoundField DataField="MealPlanId" HeaderText="MealPlanId" 
                    SortExpression="MealPlanId" />
                <asp:BoundField DataField="MealPlan" HeaderText="MealPlan" 
                    SortExpression="MealPlan" />
                <asp:BoundField DataField="RoomTypeId" HeaderText="RoomTypeId" 
                    SortExpression="RoomTypeId" />
                <asp:BoundField DataField="RateType" HeaderText="RateType" 
                    SortExpression="RateType" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" 
                    SortExpression="Priority" />
                <asp:BoundField DataField="RateTypeId" HeaderText="RateTypeId" 
                    SortExpression="RateTypeId" />
                <asp:BoundField DataField="RateOption" HeaderText="RateOption" 
                    SortExpression="RateOption" />
                <asp:BoundField DataField="RateCodeId" HeaderText="RateCodeId" 
                    SortExpression="RateCodeId" />
                <asp:BoundField DataField="Created" HeaderText="Created" 
                    SortExpression="Created" />
                <asp:BoundField DataField="RateRecieved" HeaderText="RateRecieved" 
                    SortExpression="RateRecieved" />
                <asp:BoundField DataField="Start" HeaderText="Start" SortExpression="Start" />
                <asp:BoundField DataField="Finish" HeaderText="Finish" 
                    SortExpression="Finish" />
                <asp:CheckBoxField DataField="PerPax" HeaderText="PerPax" 
                    SortExpression="PerPax" />
                <asp:BoundField DataField="RatePax1" HeaderText="RatePax1" 
                    SortExpression="RatePax1" />
                <asp:BoundField DataField="RatePax2" HeaderText="RatePax2" 
                    SortExpression="RatePax2" />
                <asp:BoundField DataField="RatePax3" HeaderText="RatePax3" 
                    SortExpression="RatePax3" />
                <asp:BoundField DataField="RatePax4" HeaderText="RatePax4" 
                    SortExpression="RatePax4" />
                <asp:BoundField DataField="RatePax5" HeaderText="RatePax5" 
                    SortExpression="RatePax5" />
                <asp:BoundField DataField="RatePax6" HeaderText="RatePax6" 
                    SortExpression="RatePax6" />
                <asp:BoundField DataField="RatePax7" HeaderText="RatePax7" 
                    SortExpression="RatePax7" />
                <asp:BoundField DataField="RatePax8" HeaderText="RatePax8" 
                    SortExpression="RatePax8" />
                <asp:BoundField DataField="RatePax9" HeaderText="RatePax9" 
                    SortExpression="RatePax9" />
                <asp:BoundField DataField="RatePax10" HeaderText="RatePax10" 
                    SortExpression="RatePax10" />
                <asp:BoundField DataField="RateExtra" HeaderText="RateExtra" ReadOnly="True" 
                    SortExpression="RateExtra" />
                <asp:BoundField DataField="ExtraPax" HeaderText="ExtraPax" 
                    SortExpression="ExtraPax" />
                <asp:CheckBoxField DataField="LockChildrenRates" HeaderText="LockChildrenRates" 
                    SortExpression="LockChildrenRates" />
                <asp:BoundField DataField="RateChld1" HeaderText="RateChld1" 
                    SortExpression="RateChld1" />
                <asp:BoundField DataField="RateChld2" HeaderText="RateChld2" 
                    SortExpression="RateChld2" />
                <asp:BoundField DataField="RateChld3" HeaderText="RateChld3" 
                    SortExpression="RateChld3" />
                <asp:BoundField DataField="RateChld4" HeaderText="RateChld4" 
                    SortExpression="RateChld4" />
                <asp:BoundField DataField="Desctiption" HeaderText="Desctiption" 
                    SortExpression="Desctiption" />
                <asp:BoundField DataField="Allotment" HeaderText="Allotment" 
                    SortExpression="Allotment" />
                <asp:BoundField DataField="CutOff" HeaderText="CutOff" 
                    SortExpression="CutOff" />
                <asp:BoundField DataField="SpecialId" HeaderText="SpecialId" 
                    SortExpression="SpecialId" />
                <asp:BoundField DataField="SpecTitle" HeaderText="SpecTitle" 
                    SortExpression="SpecTitle" />
                <asp:BoundField DataField="BookingCode" HeaderText="BookingCode" 
                    SortExpression="BookingCode" />
                <asp:BoundField DataField="BkStart" HeaderText="BkStart" 
                    SortExpression="BkStart" />
                <asp:BoundField DataField="BkFinish" HeaderText="BkFinish" 
                    SortExpression="BkFinish" />
                <asp:BoundField DataField="PerPaxDisp" HeaderText="PerPaxDisp" ReadOnly="True" 
                    SortExpression="PerPaxDisp" />
                <asp:BoundField DataField="RateOptionDisp" HeaderText="RateOptionDisp" 
                    ReadOnly="True" SortExpression="RateOptionDisp" />
                <asp:BoundField DataField="CnStart" HeaderText="CnStart" 
                    SortExpression="CnStart" />
                <asp:BoundField DataField="CnFinish" HeaderText="CnFinish" 
                    SortExpression="CnFinish" />
                <asp:BoundField DataField="Chld1ShLabel" HeaderText="Chld1ShLabel" 
                    SortExpression="Chld1ShLabel" />
                <asp:BoundField DataField="Chld1AgShLabel" HeaderText="Chld1AgShLabel" 
                    ReadOnly="True" SortExpression="Chld1AgShLabel" />
                <asp:BoundField DataField="Chld2ShLabel" HeaderText="Chld2ShLabel" 
                    SortExpression="Chld2ShLabel" />
                <asp:BoundField DataField="Chld2AgShLabel" HeaderText="Chld2AgShLabel" 
                    ReadOnly="True" SortExpression="Chld2AgShLabel" />
                <asp:BoundField DataField="Chld3ShLabel" HeaderText="Chld3ShLabel" 
                    SortExpression="Chld3ShLabel" />
                <asp:BoundField DataField="Chld3AgShLabel" HeaderText="Chld3AgShLabel" 
                    ReadOnly="True" SortExpression="Chld3AgShLabel" />
                <asp:BoundField DataField="Chld4ShLabel" HeaderText="Chld4ShLabel" 
                    SortExpression="Chld4ShLabel" />
                <asp:BoundField DataField="Chld4AgShLabel" HeaderText="Chld4AgShLabel" 
                    ReadOnly="True" SortExpression="Chld4AgShLabel" />
                <asp:BoundField DataField="MaxOccupancy" HeaderText="MaxOccupancy" 
                    SortExpression="MaxOccupancy" />
                <asp:BoundField DataField="OccText" HeaderText="OccText" 
                    SortExpression="OccText" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:CheckBoxField DataField="R2" HeaderText="R2" ReadOnly="True" 
                    SortExpression="R2" />
                <asp:CheckBoxField DataField="R3" HeaderText="R3" ReadOnly="True" 
                    SortExpression="R3" />
                <asp:CheckBoxField DataField="R4" HeaderText="R4" ReadOnly="True" 
                    SortExpression="R4" />
                <asp:CheckBoxField DataField="R5" HeaderText="R5" ReadOnly="True" 
                    SortExpression="R5" />
                <asp:CheckBoxField DataField="R6" HeaderText="R6" ReadOnly="True" 
                    SortExpression="R6" />
                <asp:CheckBoxField DataField="R7" HeaderText="R7" ReadOnly="True" 
                    SortExpression="R7" />
                <asp:CheckBoxField DataField="R8" HeaderText="R8" ReadOnly="True" 
                    SortExpression="R8" />
                <asp:CheckBoxField DataField="R9" HeaderText="R9" ReadOnly="True" 
                    SortExpression="R9" />
                <asp:CheckBoxField DataField="R10" HeaderText="R10" ReadOnly="True" 
                    SortExpression="R10" />
                <asp:BoundField DataField="ChldCategories" HeaderText="ChldCategories" 
                    SortExpression="ChldCategories" />
            </Columns>
        </asp:GridView>


    </div>
</asp:Content>
