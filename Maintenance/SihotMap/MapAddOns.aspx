<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false" 
    CodeFile="MapAddOns.aspx.vb" Inherits="Maintenance_SihotMap_MapAddOns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    SIHOT Tracking Code To Add On Supplements Mapping
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbComplementary" runat="server" Text="Add on Tracking Codes" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvAddOns" runat="server" SkinID="skGridView" 
                        AutoGenerateColumns="False" DataKeyNames="TrackingCode" DataSourceID="dsAddOn" >
                        <Columns>
                            <asp:TemplateField HeaderText="Tracking Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrackingCode") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="edtTracking" runat="server" Text='<%# Bind("TrackingCode") %>' MaxLength="10" CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_edtTracking" runat="server" ErrorMessage="Required field!" 
                                        Display="None" ControlToValidate="edtTracking" />
                                    <asp:ValidatorCalloutExtender ID="call_req_edtTracking" runat="server" TargetControlID="req_edtTracking" />
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="Commision" HeaderText="Commission" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:CheckBoxField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" style="margin-right: 5px;" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" />
                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" Text="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete tracking code?');" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" style="margin-right: 5px;" 
                                        CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRow2B" style="width: 152px;" >
                                        <b>Tracking Code</b>
                                    </td>
                                    <td class="GridRow2B" style="width: 102px; text-align: center;" >
                                        <b>Commision</b>
                                    </td>
                                    <td class="GridRow2B" style="width: 52px;" >
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>                                
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvAddOn" runat="server" DataKeyNames="TrackingCode" DataSourceID="dsAddOn" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 152px; height: 30px;" >
                                        <asp:TextBox ID="txtTracking" runat="server" Text='<%# Bind("TrackingCode") %>' MaxLength="10" CssClass="TextBox"/>
                                        <asp:RequiredFieldValidator ID="req_txtTracking" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtTracking" />
                                        <asp:ValidatorCalloutExtender ID="call_req_txtTracking" runat="server" TargetControlID="req_txtTracking" />
                                    </td>
                                    <td class="GridRowClear" style="width: 102px; height: 30px; text-align: center;" >
                                        <asp:CheckBox ID="CommisionCheckBox" runat="server" Checked='<%# Bind("Commision") %>' />
                                    </td>
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" style="margin-right: 5px;"
                                            CommandName="Insert" ImageUrl="~/Images/accept_inline.gif" />
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" />
                                    </td>
                                </tr>
                            </table>                                
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div style="width: 306px; text-align: right">
                                <asp:Button ID="btNew" runat="server" Text="New Tracking Code" SkinID="skBtnBase" CommandName="New" style="margin: 10px 0px 3px 0px;" />
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="width: 306px; text-align: right">
                                <asp:Button ID="btNew" runat="server" Text="New Tracking Code" SkinID="skBtnBase" CommandName="New" style="margin: 10px 0px 3px 0px;" />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAddOn" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="dsAddOnTrackingTableAdapters.AddOnTrackingTableAdapter" 
            UpdateMethod="Update" >
            <DeleteParameters>
                <asp:Parameter Name="Original_TrackingCode" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Commision" Type="Boolean" />
                <asp:Parameter Name="Original_TrackingCode" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TrackingCode" Type="String" />
                <asp:Parameter Name="Commision" Type="Boolean" DefaultValue="True" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="dummy" runat="server" />
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
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow1T"><br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

