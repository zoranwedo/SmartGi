<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterSpecial.master"
    AutoEventWireup="false" CodeFile="SpecOverview.aspx.vb" Inherits="Contracts_Special_SpecOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Special Rate Overview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Blue">
        <table>
            <tr>
                <td colspan="2" class="GridLabelBG">
                    <asp:Label ID="lbContract" runat="server" SkinID="skGridLabel">Attached Contracts</asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DropDownList ID="ddlContract" runat="server" CssClass="TextBox" AutoPostBack="True"
                        DataSourceID="dsContract" DataTextField="CtrLabel" DataValueField="ContractId"
                        Width="100%">
                    </asp:DropDownList>
                    <%--<br />
                    <asp:Button ID="linkNew" runat="server" Text="Print Rate Sheet" SkinID="skBtnBase" />--%>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding: 5px;">
                    <asp:Button ID="linkNew" runat="server" Text="Print Rate Sheet" SkinID="skBtnBase" />
                    <div class="Green" style="float: right;">
                        <asp:Button ID="btEDS" runat="server" Text="Karisma Layout" SkinID="skBtnBase" />
                        <asp:Button ID="btGroup" runat="server" Text="Group Layout" SkinID="skBtnBase" />
                        <asp:Button ID="btGOGO" runat="server" Text="GOGO Layout" SkinID="skBtnBase" /> 
                        <%--OnClientClick="alert('GOGO Layout is not implemented yet!')" />--%>
                    </div>
                </td>
            </tr>
            <tr>
                <td class=" GridBorder" valign="top">
                    <asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" DataKeyNames="ContractRateID"
                        DataSourceID="dsRates" SkinID="skGridView" ShowHeader="False">
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
                        <EmptyDataTemplate>
                            <div class="Red" style="width: 700px; font-style: italic; text-align: center; font-size: 120%;">
                                No contracts attached to special.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsRates" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByContract" TypeName="dsCtrPrevTableAdapters.SpecialRateTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SpecialId" QueryStringField="SpecialID" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlContract" Name="ContractId" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCntSupp" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="CntReportsTableAdapters.RateSupplTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCntRates" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByOverview" TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="value"
                                Type="String" DefaultValue="" />
                            <asp:ControlParameter ControlID="ddlContract" Name="ContractId" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:QueryStringParameter DefaultValue="" Name="SpecialId" QueryStringField="SpecialID"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsContract" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SelectContractTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsLayoutRates" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsSpecMatrixTableAdapters.LayoutRatesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlContract" Name="ContractId" PropertyName="SelectedValue" Type="Int32" />
                <asp:QueryStringParameter Name="SpecialId" QueryStringField="SpecialID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHeader" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsSpecMatrixTableAdapters.ContractLayoutHeaderTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlContract" Name="ContractId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
