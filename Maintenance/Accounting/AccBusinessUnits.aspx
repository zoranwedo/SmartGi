﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterDepartments.master" AutoEventWireup="false" 
    CodeFile="AccBusinessUnits.aspx.vb" Inherits="Maintenance_Accounting_AccBusinessUnits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Business Units
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>    
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblDep" runat="server" Text="Business Unit" SkinID="skGridLabel" />
                    <asp:CheckBox ID="fltActive" runat="server" Text="Active Only" Checked="false" 
                        ForeColor="White" AutoPostBack="true" TextAlign="Left" style="float: right;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvUnit" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="AccBusinessUnitID" 
                        DataSourceID="dsUnits" >
                        <Columns>
                            <asp:BoundField DataField="AccBusinessUnitID" HeaderText="AccBusinessUnitID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="AccBusinessUnitID" 
                                Visible="False" />
                            <asp:BoundField DataField="AccBusinessUnitName" 
                                HeaderText="Name" SortExpression="AccBusinessUnitName" >
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="AccBusinessUnitIsActive" 
                                HeaderText="Active" SortExpression="AccBusinessUnitIsActive" >
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
                    <asp:FormView ID="newUnit" runat="server" DataSourceID="dsUnits" HorizontalAlign="Right" >
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
                                        Unit
                                    </td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="height: 30px; padding-right: 2px;">
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("AccBusinessUnitName") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqNameTextBox" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="NameTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqNameTextBoxExt" runat="server" 
                                            TargetControlID="reqNameTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 50px;">
                                        <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Bind("AccBusinessUnitIsActive") %>' />
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
                    <asp:ObjectDataSource ID="dsUnits" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetActive" 
                        TypeName="AccUnitsTableAdapters.AccBusinessUnitTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_AccBusinessUnitID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AccBusinessUnitName" Type="String" />
                            <asp:Parameter Name="AccBusinessUnitIsActive" Type="Boolean" />
                            <asp:Parameter Name="Original_AccBusinessUnitID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" PropertyName="Checked" 
                                Type="Boolean" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccBusinessUnitName" Type="String" />
                            <asp:Parameter Name="AccBusinessUnitIsActive" Type="Boolean" />
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
