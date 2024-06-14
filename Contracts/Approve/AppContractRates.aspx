<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Approve/masterAppContracts.master"
    AutoEventWireup="false" CodeFile="AppContractRates.aspx.vb" Inherits="Contracts_Approve_AppContractRates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contract Rates
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <%--<asp:ObjectDataSource ID="dsCntSupp" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="CntReportsTableAdapters.RateSupplTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByOverview" TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="value"
                    Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                <asp:Parameter Name="SpecialId" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:ObjectDataSource>--%><%--</ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="gvRates" EventName="DataBound" />
             </Triggers>
        </asp:UpdatePanel>--%><%--</ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="gvRates" EventName="DataBound" />
             </Triggers>
        </asp:UpdatePanel>--%>
    <div class="Blue">
        <asp:Button ID="linkNew" runat="server" Text="Print Rate Sheet" SkinID="skBtnBase" Visible="false" />
        <br />
&nbsp;<asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" DataKeyNames="ContractRateID"
            DataSourceID="dsRates" SkinID="skGridView" ShowHeader="False" 
            EnableModelValidation="True" ShowFooter="True">
            <RowStyle HorizontalAlign="Right" />
            <Columns>
                <asp:TemplateField>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" onclick="lbUpdate_Click">Update All</asp:LinkButton>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelected" runat="server" TextAlign="Left" 
                            Text='<%# Eval("ContractRateID") %>' 
                            Enabled='<%# Eval("Approved") = "0" %>' 
                            Checked='<%# iif(Eval("Approved")>0,true,false) %>' />
                        <asp:HiddenField ID="hfRoom" runat="server" Value='<%# Eval("RoomTypeId") %>' />
                        <asp:HiddenField ID="hfRoomV" runat="server" Value='<%# Eval("Approved") %>' />
                    </ItemTemplate>
                    <ItemStyle Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RoomTypeId">
                    <ItemTemplate>
                        <asp:Label ID="lblRoomID" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                        <asp:Label ID="lblRoom" runat="server" Font-Italic="true" Text='<%# "&nbsp;&nbsp;[" & Eval("RoomType") & "]" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RateCodeId">
                    <ItemTemplate>
                        <asp:Label ID="lblRateCode" runat="server" Text='<%# Bind("RateCodeId") %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MealPlanId">
                    <ItemTemplate>
                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Bind("MealPlanId") %>' />
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
                    <ItemStyle HorizontalAlign="Left" Wrap="False" />
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
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblPerArrival" runat="server" Text="PerArrival" Visible='<%# Eval("RateOption")=0 %>' />
                        <asp:Label ID="lblPerStay" runat="server" Text="PerStay" Visible='<%# Eval("RateOption")=1 %>' />
                        <asp:Label ID="lblInclusiv" runat="server" Text="Inclusiv" Visible='<%# Eval("RateOption")=2 %>' />
                    </ItemTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfExtra" runat="server" Value='<%# Bind("RateExtra") %>' />
                        <asp:HiddenField ID="hfRoccup" runat="server" Value='<%# Bind("MaxROccupancy") %>' />
                    </ItemTemplate>
                    <ControlStyle CssClass="GridRowClear" />
                    <ItemStyle Width="10px" CssClass="GridRowClear" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="dsRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsApproveContractTableAdapters.ContractRateTableAdapter">
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
         <asp:HiddenField ID="dummy" runat="server" />
        <%--<asp:HiddenField ID="hfRoomType" runat="server" Value='<%# Eval("DetailID") %>' />--%>
        
                    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label></p>
                        <p style="text-align: right;" class="GridRow1T">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <%--</ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="gvRates" EventName="DataBound" />
             </Triggers>
        </asp:UpdatePanel>--%>
        <%--</ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="gvRates" EventName="DataBound" />
             </Triggers>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
