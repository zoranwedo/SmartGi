<%@ Page Language="VB" MasterPageFile="~/Maintenance/Service/Service.master" AutoEventWireup="false" 
    CodeFile="ServiceSetup.aspx.vb" Inherits="Maintenance_Service_ServiceSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    SMART Service Setup
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblCtrTitle" runat="server" Text="Service Parameters" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <table cellpadding="0" cellspacing="2px">
                                <tr> 
                                    <td class="SelectRowClear" style="width: 304px; font-weight: bold; text-align:center; border-bottom: solid 1px;" >
                                        Service
                                    </td> 
                                    <td class="SelectRowClear" style="width: 304px; font-weight: bold; text-align:center; border-bottom: solid 1px;" >
                                        Schedule
                                    </td> 
                                    <td class="SelectRowClear" style="width: 104px; font-weight: bold; text-align:center; border-bottom: solid 1px;" >
                                        Repeat
                                    </td> 
                                </tr>
                            </table>
                            <asp:GridView ID="gvSfsParams" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataKeyNames="ServiceID" DataSourceID="dsSfsParams" SelectedIndex="0" >
                                <RowStyle Height="30px" />
                                <Columns>
                                    <asp:BoundField DataField="ServiceID" HeaderText="ID" ReadOnly="True" >
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Name" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" Text='<%# Eval("ServiceName") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="200px" Font-Bold="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Active" >
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                                Checked='<%# Bind("ServiceEnabled") %>' Enabled="false" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                                Checked='<%# Bind("ServiceEnabled") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("RunEvery") %>' />&nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRunEvery" runat="server" Text='<%# Bind("RunEvery") %>' CssClass="TextBox" Width="90%" />
                                            <asp:RequiredFieldValidator ID="reqRunEvery" runat="server" ErrorMessage="Required field!"
                                                SkinID="skRequired" ControlToValidate="txtRunEvery" />
                                            <asp:ValidatorCalloutExtender ID="reqRunEverycal" runat="server" TargetControlID="reqRunEvery" />
                                            <asp:CompareValidator ID="intRunEvery" runat="server" ErrorMessage="Number required!"
                                                SkinID="skInteger" Type="Integer" Operator="DataTypeCheck" ControlToValidate="txtRunEvery" />
                                            <asp:ValidatorCalloutExtender ID="intRunEverycal" runat="server" TargetControlID="intRunEvery" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Every" >
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Iif(Eval("TimeInterval")="d","day(s)","hour(s)") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlEvery" runat="server" SelectedValue='<%# Bind("TimeInterval") %>' 
                                                CssClass="TextBox" Width="90%" >
                                                <asp:ListItem Text="day(s)" Value="d" />
                                                <asp:ListItem Text="hour(s)" Value="h" />
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Starting On" >
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("StartingOn","{0:MM/dd/yyyy hh:mm:ss tt}") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtStartingOn" runat="server" Text='<%# Bind("StartingOn","{0:MM/dd/yyyy hh:mm:ss tt}") %>' 
                                                CssClass="TextBox" ToolTip="Dateformat is: 'MM/dd/yyyy hh:mm:ss tt'" />
                                            <asp:CalendarExtender ID="calStartingOn" runat="server" 
                                                Format="MM/dd/yyyy hh:mm:ss tt" TargetControlID="txtStartingOn"/> 
                                            <asp:RequiredFieldValidator ID="reqStartingOn" runat="server" ErrorMessage="Required field!"
                                                SkinID="skRequired" ControlToValidate="txtStartingOn" />
                                            <asp:ValidatorCalloutExtender ID="reqStartingOncal" runat="server" TargetControlID="reqStartingOn" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Every" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblRepeatEvery" runat="server" Text='<%# Bind("RepeatEvery") %>' />&nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRepeatEvery" runat="server" Text='<%# Bind("RepeatEvery") %>' CssClass="TextBox" Width="90%" />
                                            <asp:RequiredFieldValidator ID="reqRepeatEvery" runat="server" ErrorMessage="Required field!"
                                                SkinID="skRequired" ControlToValidate="txtRepeatEvery" />
                                            <asp:ValidatorCalloutExtender ID="reqRepeatEverycal" runat="server" TargetControlID="reqRepeatEvery" />
                                            <asp:CompareValidator ID="intRepeatEvery" runat="server" ErrorMessage="Number required!"
                                                SkinID="skInteger" Type="Integer" Operator="DataTypeCheck" ControlToValidate="txtRepeatEvery" />
                                            <asp:ValidatorCalloutExtender ID="intRepeatEverycal" runat="server" TargetControlID="intRepeatEvery" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="For" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblRepeatFor" runat="server" Text='<%# Bind("RepeatFor") %>' />&nbsp;
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRepeatFor" runat="server" Text='<%# Bind("RepeatFor") %>' CssClass="TextBox" Width="90%" />
                                            <asp:RequiredFieldValidator ID="reqRepeatFor" runat="server" ErrorMessage="Required field!"
                                                SkinID="skRequired" ControlToValidate="txtRepeatFor" />
                                            <asp:ValidatorCalloutExtender ID="reqRepeatForcal" runat="server" TargetControlID="reqRepeatFor" />
                                            <asp:CompareValidator ID="intRepeatFor" runat="server" ErrorMessage="Number required!"
                                                SkinID="skInteger" Type="Integer" Operator="DataTypeCheck" ControlToValidate="txtRepeatFor" />
                                            <asp:ValidatorCalloutExtender ID="intRepeatForcal" runat="server" TargetControlID="intRepeatFor" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/edit_inline.gif"
                                                OnClientClick="return confirm('Change those parameters with maximum precaution!');" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/accept_inline.gif"  
                                                OnClientClick="return confirm('Are you sure you want to change this?\nChange those parameters with maximum precaution!');" />
                                            <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" />
                                        </EditItemTemplate>
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No services has been configured!<br />
                                    Please contact network administrator.
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <div style="border: none 0px; margin-top: 5px;">
                            <asp:DetailsView ID="dvInfo" runat="server" Height="30px" 
                                AutoGenerateRows="False" DataKeyNames="ServiceID" DataSourceID="dsSfsParams"
                                BorderStyle="None">
                                <Fields>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/info_icon.png" />
                                        </HeaderTemplate>
                                        <HeaderStyle BorderStyle="None" Width="30px" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ServiceInfo") %>' />
                                        </ItemTemplate>
                                        <ItemStyle BorderStyle="None" Width="630px" />
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                            </div> 
                            <asp:ObjectDataSource ID="dsSfsParams" runat="server" OldValuesParameterFormatString="original_{0}" 
                                TypeName="dsSmartServiceTableAdapters.ServiceTimeTableAdapter"
                                SelectMethod="GetAllData"
                                UpdateMethod="Update"
                                DeleteMethod="Delete">
                                <UpdateParameters>
                                    <asp:Parameter Name="RunEvery" Type="Int32" />
                                    <asp:Parameter Name="TimeInterval" Type="String" />
                                    <asp:Parameter Name="StartingOn" Type="String" />
                                    <asp:Parameter Name="RepeatEvery" Type="Int32" />
                                    <asp:Parameter Name="RepeatFor" Type="Int32" />
                                    <asp:Parameter Name="ServiceEnabled" Type="Boolean" />
                                    <asp:Parameter Name="Original_ServiceID" Type="Int32" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ServiceID" Type="Int32" />
                                </DeleteParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                Local server time:
                <asp:Label ID="lblTime" runat="server" />&nbsp;
                
                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
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
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

