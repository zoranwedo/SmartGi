<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false"
    CodeFile="MapChildren.aspx.vb" Inherits="Maintenance_SihotMap_MapChildren" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    SIHOT Guest Categories Mapping
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbChildren" runat="server" Text="Guest Categories" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvChildren" runat="server" DataSourceID="dsChildren" DataKeyNames="CHILD_GUEST_TYPE"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" Height="30px" />
                        <Columns>
                            <asp:TemplateField HeaderText="SIHOT" >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CHILD_GUEST_TYPE") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Label" >
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CHILD_LABEL") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCHILD_LABEL" runat="server" Text='<%# Bind("CHILD_LABEL") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="txtCHILD_LABEL_Required" runat="server" ErrorMessage="Required field!" 
                                        Display="None" ControlToValidate="txtCHILD_LABEL" />
                                    <asp:ValidatorCalloutExtender ID="txtCHILD_LABEL_RequiredCallout" runat="server" TargetControlID="txtCHILD_LABEL_Required" />
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short" >
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("CHILD_SHORT_LABEL") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCHILD_SHORT_LABEL" runat="server" Text='<%# Bind("CHILD_SHORT_LABEL") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="txtCHILD_SHORT_LABEL_Required" runat="server" ErrorMessage="Required field!" 
                                        Display="None" ControlToValidate="txtCHILD_SHORT_LABEL" />
                                    <asp:ValidatorCalloutExtender ID="txtCHILD_SHORT_LABEL_RequiredCallout" runat="server" TargetControlID="txtCHILD_SHORT_LABEL_Required" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From" >
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("CHILD_FROM") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCHILD_FROM" runat="server" Text='<%# Bind("CHILD_FROM") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="txtCHILD_FROM_Required" runat="server" ErrorMessage="Required field!" 
                                        Display="None" ControlToValidate="txtCHILD_FROM" />
                                    <asp:ValidatorCalloutExtender ID="ttxtCHILD_FROM_RequiredCallout" runat="server" TargetControlID="txtCHILD_FROM_Required" />
                                    <asp:CompareValidator ID="txtCHILD_FROM_Integer" runat="server" ControlToValidate="txtCHILD_FROM"
                                        Display="None" ErrorMessage="Number field!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="txtCHILD_FROM_IntegerCallout" runat="server" TargetControlID="txtCHILD_FROM_Integer" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Up To" >
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("CHILD_UP_TO") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCHILD_UP_TO" runat="server" Text='<%# Bind("CHILD_UP_TO") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="txtCHILD_UP_TO_Required" runat="server" ErrorMessage="Required field!" 
                                        Display="None" ControlToValidate="txtCHILD_UP_TO" />
                                    <asp:ValidatorCalloutExtender ID="txtCHILD_UP_TO_RequiredCallout" runat="server" TargetControlID="txtCHILD_UP_TO_Required" />
                                    <asp:CompareValidator ID="txtCHILD_UP_TO_Integer" runat="server" ControlToValidate="txtCHILD_UP_TO"
                                        Display="None" ErrorMessage="Number field!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="txtCHILD_UP_TO_IntegerCallout" runat="server" TargetControlID="txtCHILD_UP_TO_Integer" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="G.Type" >
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CHILD_TYPE") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCHILD_TYPE" runat="server" SelectedValue='<%# Bind("CHILD_TYPE") %>' CssClass="TextBox" >
                                        <asp:ListItem Text="i (infant)" Value ="i" />
                                        <asp:ListItem Text="c (child)" Value ="c" />
                                        <asp:ListItem Text="j (junior)" Value ="j" />
                                        <asp:ListItem Text="A (adult)" Value ="A" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Free" >
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("FREE") %>' Enabled="false" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("FREE") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="40px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" ToolTip="Edit child category" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" />&nbsp;
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Delete child category" 
                                        CommandName="Delete" OnClientClick="confirm('Are you sure you want to delete children category?')"
                                        ImageUrl="~/Images/delete_inline.gif" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                        CommandName="Update" ImageUrl="~/Images/accept_inline.gif" />&nbsp;
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRow2B" style="width: 82px; font-weight: bold;" >
                                        SIHOT
                                    </td> 
                                    <td class="GridRow2B" style="width: 152px; font-weight: bold;" >
                                        Label
                                    </td> 
                                    <td class="GridRow2B" style="width: 102px; font-weight: bold;" >
                                        Short
                                    </td> 
                                    <td class="GridRow2B" style="width: 102px; font-weight: bold;" >
                                        From
                                    </td> 
                                    <td class="GridRow2B" style="width: 102px; font-weight: bold;" >
                                        Up To
                                    </td> 
                                    <td class="GridRow2B" style="width: 102px; font-weight: bold;" >
                                        G.Type
                                    </td> 
                                    <td class="GridRow2B" style="width: 42px; font-weight: bold;" >
                                        Free
                                    </td> 
                                    <td class="GridRow2B" style="width: 52px; font-weight: bold;" >
                                        &nbsp;
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvChildren" runat="server" DataKeyNames="CHILD_GUEST_TYPE" 
                        DataSourceID="dsChildren">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px; height: 30px;" >
                                        <asp:TextBox ID="txtCHILD_GUEST_TYPE" runat="server" Text='<%# Bind("CHILD_GUEST_TYPE") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtCHILD_GUEST_TYPE_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtCHILD_GUEST_TYPE" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_GUEST_TYPE_RequiredCallout" runat="server" TargetControlID="txtCHILD_GUEST_TYPE_Required" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 152px; height: 30px;" >
                                        <asp:TextBox ID="txtCHILD_LABEL" runat="server" Text='<%# Bind("CHILD_LABEL") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtCHILD_LABEL_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtCHILD_LABEL" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_LABEL_RequiredCallout" runat="server" TargetControlID="txtCHILD_LABEL_Required" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 102px; height: 30px;" >
                                        <asp:TextBox ID="txtCHILD_SHORT_LABEL" runat="server" Text='<%# Bind("CHILD_SHORT_LABEL") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtCHILD_SHORT_LABEL_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtCHILD_SHORT_LABEL" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_SHORT_LABEL_RequiredCallout" runat="server" TargetControlID="txtCHILD_SHORT_LABEL_Required" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 102px; height: 30px;" >
                                        <asp:TextBox ID="txtCHILD_FROM" runat="server" Text='<%# Bind("CHILD_FROM") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtCHILD_FROM_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtCHILD_FROM" />
                                        <asp:ValidatorCalloutExtender ID="ttxtCHILD_FROM_RequiredCallout" runat="server" TargetControlID="txtCHILD_FROM_Required" />
                                        <asp:CompareValidator ID="txtCHILD_FROM_Integer" runat="server" ControlToValidate="txtCHILD_FROM"
                                            Display="None" ErrorMessage="Number field!" Operator="DataTypeCheck" Type="Integer" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_FROM_IntegerCallout" runat="server" TargetControlID="txtCHILD_FROM_Integer" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 102px; height: 30px;" >
                                        <asp:TextBox ID="txtCHILD_UP_TO" runat="server" Text='<%# Bind("CHILD_UP_TO") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtCHILD_UP_TO_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtCHILD_UP_TO" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_UP_TO_RequiredCallout" runat="server" TargetControlID="txtCHILD_UP_TO_Required" />
                                        <asp:CompareValidator ID="txtCHILD_UP_TO_Integer" runat="server" ControlToValidate="txtCHILD_UP_TO"
                                            Display="None" ErrorMessage="Number field!" Operator="DataTypeCheck" Type="Integer" />
                                        <asp:ValidatorCalloutExtender ID="txtCHILD_UP_TO_IntegerCallout" runat="server" TargetControlID="txtCHILD_UP_TO_Integer" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 102px; height: 30px;" >
                                        <asp:DropDownList ID="ddlCHILD_TYPE" runat="server" SelectedValue='<%# Bind("CHILD_TYPE") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="i (infant)" Value ="i" />
                                            <asp:ListItem Text="c (child)" Value ="c" />
                                            <asp:ListItem Text="j (junior)" Value ="j" />
                                            <asp:ListItem Text="A (adult)" Value ="A" />
                                        </asp:DropDownList>
                                    </td> 
                                    <td class="GridRowClear" style="width: 42px; height: 30px;" >
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("FREE") %>' />
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                            CommandName="Insert" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />&nbsp;
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td> 
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 152px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 102px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 102px;" >&nbsp;</td> 
                                    <%--<td class="GridRowClear" style="width: 256px; text-align: right; padding-top: 5px;" >--%>
                                    <td class="GridRowClear" style="width: 298px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Guest Category" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 152px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 102px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 102px;" >&nbsp;</td> 
                                    <%--<td class="GridRowClear" style="width: 256px; text-align: right; padding-top: 5px;" >--%>
                                    <td class="GridRowClear" style="width: 298px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Guest Category" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="hfUser" runat="server" />
    <asp:ObjectDataSource ID="dsChildren" runat="server" OldValuesParameterFormatString="{0}"
        TypeName="dsSIHOTTableAdapters.SihotChildPolicyTableAdapter" 
        SelectMethod="GetData" 
        UpdateMethod="UpdateQuery"
        DeleteMethod="DeleteQuery"
        InsertMethod="InsertQuery" >
        <DeleteParameters>
            <asp:ControlParameter Name="ChangeUser" Type="String" ControlID="hfUser" PropertyName="Value" />
            <asp:Parameter Name="CHILD_GUEST_TYPE" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CHILD_GUEST_TYPE" Type="String" />
            <asp:Parameter Name="CHILD_LABEL" Type="String" />
            <asp:Parameter Name="CHILD_SHORT_LABEL" Type="String" />
            <asp:Parameter Name="CHILD_FROM" Type="Int32" />
            <asp:Parameter Name="CHILD_UP_TO" Type="Int32" />
            <asp:Parameter Name="CHILD_TYPE" Type="String" />
            <asp:Parameter Name="FREE" Type="Boolean" />
            <asp:ControlParameter Name="ChangeUser" Type="String" ControlID="hfUser" PropertyName="Value" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CHILD_GUEST_TYPE" Type="String" />
            <asp:Parameter Name="CHILD_LABEL" Type="String" />
            <asp:Parameter Name="CHILD_SHORT_LABEL" Type="String" />
            <asp:Parameter Name="CHILD_FROM" Type="Int32" />
            <asp:Parameter Name="CHILD_UP_TO" Type="Int32" />
            <asp:Parameter Name="CHILD_TYPE" Type="String" />
            <asp:Parameter Name="FREE" Type="Boolean" />
            <asp:ControlParameter Name="ChangeUser" Type="String" ControlID="hfUser" PropertyName="Value" />
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
   
</asp:Content>
