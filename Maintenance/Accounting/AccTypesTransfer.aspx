<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterTypes.master" AutoEventWireup="false" 
    CodeFile="AccTypesTransfer.aspx.vb" Inherits="Maintenance_Accounting_AccTypesTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Transfer Types
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>    
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblDep" runat="server" Text="Transfer Types" SkinID="skGridLabel" />
                    <asp:CheckBox ID="fltActive" runat="server" Text="Active Only" Checked="false" 
                        ForeColor="White" AutoPostBack="true" TextAlign="Left" style="float: right;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvTransfer" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="AccTransferTypeID" 
                        DataSourceID="dsTransfers" >
                        <Columns>
                            <asp:BoundField DataField="AccTransferTypeID" HeaderText="AccTransferTypeID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="AccTransferTypeID" 
                                Visible="False" />
                            <asp:BoundField DataField="AccTransferTypeName" 
                                HeaderText="Name" SortExpression="AccTransferTypeName" >
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="AccTransferTypeIsActive" 
                                HeaderText="Active" SortExpression="AccTransferTypeIsActive" >
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="newType" runat="server" DataSourceID="dsTransfers" HorizontalAlign="Right" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                               <tr>
                                    <td style="width: 252px; height: 16px;" class="SelectRow1B">
                                        Name
                                    </td>
                                    <td style="width: 52px; height: 16px;" class="SelectRow1B">
                                        Active
                                    </td>
                                    <td style="width: 75px; height: 16px;" class="SelectRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="height: 30px; padding-right: 2px;">
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("AccTransferTypeName") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqNameTextBox" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="NameTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqNameTextBoxExt" runat="server" 
                                            TargetControlID="reqNameTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 50px;">
                                        <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Bind("AccTransferTypeIsActive") %>' />
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td style="width: 310px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td style="width: 310px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsTransfers" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetActive" 
                        TypeName="AccUnitsTableAdapters.AccTransferTypeTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_AccTransferTypeID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AccTransferTypeName" Type="String" />
                            <asp:Parameter Name="AccTransferTypeIsActive" Type="Boolean" />
                            <asp:Parameter Name="Original_AccTransferTypeID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" PropertyName="Checked" Type="Boolean" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccTransferTypeName" Type="String" />
                            <asp:Parameter Name="AccTransferTypeIsActive" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

