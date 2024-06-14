<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterContracts.master"
    AutoEventWireup="false" CodeFile="ContractHistory.aspx.vb" Inherits="Contracts_ContractHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contracts History
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:HiddenField ID="hfState" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0" width="250px">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label3" runat="server" Text="Set new Contract State"
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <%--
                    <asp:GridView ID="gvNextState" runat="server" AutoGenerateColumns="False" DataKeyNames="StateID,StateDate"
                        ShowFooter="True" ShowHeader="False" SkinID="skGridView" Visible="False">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/edit_inline.gif" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btState" runat="server" CausesValidation="False" CommandName="Edit"
                                        Enabled="<%# iif(UserHotel,false,true) %>" SkinID="CommandLinkNormal" Text='<%# Eval("State") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="StateDesc" SortExpression="StateDesc">
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 90px;">
                                                New State:
                                            </td>
                                            <td style="width: 200px;">
                                                <asp:Label ID="Label2" runat="server" SkinID="TitleLabel" Text='<%# Eval("State") %>'
                                                    Width="150px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 90px;">
                                                Change Date:
                                            </td>
                                            <td style="width: 200px;">
                                                <gmdatepicker id="dpStart" runat="server" autoposition="True" calendaroffsetx="-200px"
                                                    calendaroffsety="25px" calendartheme="None" calendarwidth="200px" callbackeventreference=""
                                                    date='<%# Eval("StateDate") %>' enabledropshadow="True" maxdate="9999-12-31"
                                                    mindate="" nextmonthtext="&gt;" nonebuttontext="None" shownonebutton="True" showtodaybutton="True"
                                                    skinid="DatePickerThemeSilver" textboxwidth="123" zindex="1">
                                    </gmdatepicker>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dpStart"
                                                    ErrorMessage="You must enter an initial  date" Width="15px">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvTxtContFrom" runat="server" ControlToValidate="dpStart"
                                                    ErrorMessage="Invalid Initial Date" Operator="DataTypeCheck" Type="Date" Width="15px">*</asp:CompareValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StateDesc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Update"
                                        OnClientClick="return confirm('Changing state of contract is sometime ireversible! Are you certain you want to set new state for the contract?');"
                                        SkinID="CommandLinkNormal" Text="Set New State"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                                        SkinID="CommandLinkNormal" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemStyle VerticalAlign="Bottom" Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    --%>
                    <div class="Blue" style="padding-bottom: 10px;">
                        <asp:Button ID="lnkActiv" runat="server" Text='Activate' SkinID="skBtnBase"
                            OnClientClick="return confirm('Are you shure you want to ACTIVATE the contract?');"
                            Visible="<%# ModificationRights.RightsOperatorAdmin %>" 
                            Width="150px" />
                    </div>
                    <div class="Green" style="padding-bottom: 10px;">
                        <asp:Button ID="lnkDeactiv" runat="server" Text='Deactivate' SkinID="skBtnBase"
                            OnClientClick="return confirm('Are you shure you want to DEACTIVATE the contract?');"
                            Visible="<%# ModificationRights.RightsOperatorAdmin %>" 
                            Width="150px" />
                    </div>
                    <div class="Red" style="padding-bottom: 10px;">
                        <asp:Button ID="lnkSuspend" runat="server" Text='Suspend' SkinID="skBtnBase"
                            OnClick="lnkSuspend_Click" OnClientClick="return confirm('Suspending contract is ireversible! Are you shure you want to SUSPEND contract?');"
                            Visible="False" 
                            Width="150px" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0" width="250px">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblHistory" runat="server" Text="Contract History"  SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridMealPlan" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="dsCntHistory" DataKeyNames="StateID"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="ContractState" HeaderText="State" SortExpression="ContractState">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContractStateDesc" HeaderText="State Desc" 
                                SortExpression="ContractStateDesc" Visible="False">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContractStateDate" HeaderText="Date" SortExpression="ContractStateDate"
                                DataFormatString="{0:d}" HtmlEncode="False">
                            <ItemStyle Width="130px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContractStateActDate" HeaderText="State Act Date" SortExpression="ContractStateActDate"
                                DataFormatString="{0:d}" HtmlEncode="False" Visible="False"></asp:BoundField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsCntHistory" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="ContractStatesTableAdapters.ContrctHistoryTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%--<asp:ObjectDataSource ID="dsNextState" runat="server" 
                        TypeName="ContractStatesTableAdapters.NextContractStateTableAdapter" 
                        UpdateMethod="NextContractStateSet">
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="contID" 
                                Type="Int32" />
                            <asp:Parameter Name="StateID" Type="Int32" />
                            <asp:Parameter Name="StateDate" Type="DateTime" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="contID" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>--%>
                </td>
            </tr>
        </table>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            CancelControlID="btnYes" OkControlID="btnYes" DropShadow="True" Enabled="True"
            BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <p style="text-align: right;" class="GridRow1T">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
