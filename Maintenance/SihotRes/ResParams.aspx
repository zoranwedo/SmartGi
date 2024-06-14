<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false" CodeFile="ResParams.aspx.vb" 
    Inherits="Maintenance_SihotRes_ResParams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    SIHOT Reservation Import Parameters
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblCtrTitle" runat="server" Text="Import Paremeters" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvResParams" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataKeyNames="hotelCode" DataSourceID="dsResParams">
                                <Columns>
                                    <asp:TemplateField HeaderText="SIHOT<br/>Hotel">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblHotel" runat="server" Text='<%# Bind("hotelCode") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHotel" runat="server" Text='<%# Eval("hotelCode") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Prefix">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPrefix" runat="server" Text='<%# Bind("filePrefix") %>' MaxLength="8"
                                                CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="valRPrefix" runat="server" ErrorMessage="Required field!"
                                                ControlToValidate="txtPrefix" SkinID="skRequired" />
                                            <asp:ValidatorCalloutExtender ID="calRPrefix" runat="server" TargetControlID="valRPrefix" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrefix" runat="server" Text='<%# Eval("filePrefix") %>' ToolTip="Prefix of import file name." />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Import Path">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPath" runat="server" Text='<%# Bind("filePath") %>' CssClass="TextBox" 
                                                ToolTip="File paht should be set WITHOUT back-slash at the end" />
                                            <asp:RequiredFieldValidator ID="valRPath" runat="server" ErrorMessage="Required field!"
                                                ControlToValidate="txtPath" SkinID="skRequired" />
                                            <asp:ValidatorCalloutExtender ID="calRPath" runat="server" TargetControlID="valRPath" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPath" runat="server" Text='<%# Bind("filePath") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="300px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Offset<br/>(days)">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOffset" runat="server" Text='<%# Bind("dateOffset") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="valOffset" runat="server" ErrorMessage="Number required"
                                                SkinID="skInteger" ControlToValidate="txtOffset" Type="Integer" Operator="DataTypeCheck" />
                                            <asp:ValidatorCalloutExtender ID="calOffset" runat="server" TargetControlID="valOffset" />
                                            <asp:RequiredFieldValidator ID="valROffset" runat="server" ErrorMessage="Required field!"
                                                ControlToValidate="txtOffset" SkinID="skRequired" />
                                            <asp:ValidatorCalloutExtender ID="calROffset" runat="server" TargetControlID="valROffset" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("dateOffset") %>' ToolTip="Import file date offset from a day import is run." />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="importEnabled" HeaderText="Enabled">
                                        <ItemStyle Width="60px" />
                                    </asp:CheckBoxField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" 
                                                OnClientClick="return confirm('Are you sure you want to delete import parameters?\nThis will remove hotel from reservation import process.');"
                                                ImageUrl="~/Images/delete_inline.gif" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr> 
                                            <td class="GridRow1B" style="width: 82px; font-weight: bold;" >
                                                SIHOT<br/>Hotel
                                            </td> 
                                            <td class="GridRow1B" style="width: 62px; font-weight: bold;" >
                                                Prefix
                                            </td> 
                                            <td class="GridRow1B" style="width: 302px; font-weight: bold;" >
                                                Import Path
                                            </td> 
                                            <td class="GridRow1B" style="width: 62px; font-weight: bold;" >
                                                Offset<br/>(days)
                                            </td> 
                                            <td class="GridRow1B" style="width: 62px; font-weight: bold;" >
                                                Enabled
                                            </td> 
                                            <td class="GridRow1B" style="width: 77px; font-weight: bold;" >
                                                &nbsp;
                                            </td> 
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:FormView ID="fvResParams" runat="server" SkinID="formviewTitle" DataKeyNames="hotelCode"
                                DataSourceID="dsResParams">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td class="GridRow1T" style="width: 647px; height: 30px; padding-top: 5px;" valign="top"
                                                align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" CommandName="New" SkinID="skBtnBase" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td class="GridRow1T" style="width: 80px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIHotel" runat="server" Text='<%# Bind("hotelCode") %>' MaxLength="4"
                                                    CssClass="TextBox" />
                                                <asp:CompareValidator ID="valIHotel" runat="server" ErrorMessage="Number required"
                                                    SkinID="skInteger" ControlToValidate="txtIHotel" Type="Integer" Operator="DataTypeCheck" />
                                                <asp:ValidatorCalloutExtender ID="calIHotel" runat="server" TargetControlID="valIHotel" />
                                                <asp:RequiredFieldValidator ID="valRIHotel" runat="server" ErrorMessage="Required field!"
                                                    ControlToValidate="txtIHotel" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIHotel" runat="server" TargetControlID="valRIHotel" />
                                            </td>
                                            <td class="GridRow1T" style="width: 60px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIPrefix" runat="server" Text='<%# Bind("filePrefix") %>' MaxLength="8"
                                                    CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="valRIPrefix" runat="server" ErrorMessage="Required field!"
                                                    ControlToValidate="txtIPrefix" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIPrefix" runat="server" TargetControlID="valRIPrefix" />
                                            </td>
                                            <td class="GridRow1T" style="width: 300px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIPath" runat="server" Text='<%# Bind("filePath") %>' CssClass="TextBox" />
                                                <asp:TextBoxWatermarkExtender ID="wmIPath" runat="server" TargetControlID="txtIPath"
                                                    WatermarkCssClass="WaterMark" WatermarkText="File paht should be set WITHOUT back-slash at the end" />
                                                <asp:RequiredFieldValidator ID="valRIPath" runat="server" ErrorMessage="Required field!"
                                                    ControlToValidate="txtIPath" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIPath" runat="server" TargetControlID="valRIPath" />
                                            </td>
                                            <td class="GridRow1T" style="width: 60px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIOffset" runat="server" Text='<%# Bind("dateOffset") %>' CssClass="TextBox" />
                                                <asp:CompareValidator ID="valIOffset" runat="server" ErrorMessage="Number required"
                                                    SkinID="skInteger" ControlToValidate="txtIOffset" Type="Integer" Operator="DataTypeCheck" />
                                                <asp:ValidatorCalloutExtender ID="calIOffset" runat="server" TargetControlID="valIOffset" />
                                                <asp:RequiredFieldValidator ID="valRIOffset" runat="server" ErrorMessage="Required field!"
                                                    ControlToValidate="txtIOffset" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIOffset" runat="server" TargetControlID="valRIOffset" />
                                            </td>
                                            <td class="GridRow1T" style="width: 60px; height: 30px;" valign="top">
                                                <asp:CheckBox ID="enabledCheckBox" runat="server" Checked='<%# Bind("importEnabled") %>' />
                                            </td>
                                            <td class="GridRow1T" style="width: 75px; padding-left: 5px;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td class="GridRow1T" style="width: 647px; height: 30px; padding-top: 5px;" valign="top"
                                                align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" CommandName="New" SkinID="skBtnBase" />
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsResParams" runat="server" 
                                TypeName="dsSIHOTTableAdapters.ResParamsTableAdapter"
                                SelectMethod="GetData" 
                                InsertMethod="InsertQuery"
                                UpdateMethod="UpdateQuery"
                                DeleteMethod="DeleteQuery">
                                <InsertParameters>
                                    <asp:Parameter Name="hotelCode" Type="Int32" />
                                    <asp:Parameter Name="filePath" Type="String" />
                                    <asp:Parameter Name="filePrefix" Type="String" />
                                    <asp:Parameter Name="dateOffset" Type="Int32" />
                                    <asp:Parameter Name="importEnabled" Type="Boolean" />
                                    <asp:Parameter Name="editUser" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="filePath" Type="String" />
                                    <asp:Parameter Name="filePrefix" Type="String" />
                                    <asp:Parameter Name="dateOffset" Type="Int32" />
                                    <asp:Parameter Name="importEnabled" Type="Boolean" />
                                    <asp:Parameter Name="editUser" Type="String" />
                                    <asp:Parameter Name="hotelCode" Type="Int32" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="editUser" Type="String" />
                                    <asp:Parameter Name="hotelCode" Type="Int32" />
                                </DeleteParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                
                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Delete Market" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                                </p>
                                <p style="text-align: right;" class="GridRow2TB">
                                    <br />
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                                    <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

