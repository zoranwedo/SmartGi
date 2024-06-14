<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Concept.aspx.vb" Inherits="Maintenance_Concept" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Concepts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Concept" SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridConcept" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="ConceptID" 
                        DataSourceID="dsConcept" >
                        <Columns>
                            <asp:BoundField DataField="ConceptID" HeaderText="Code" ReadOnly="True" SortExpression="ConceptID" Visible="false" />
                            <asp:BoundField DataField="ConceptCode" HeaderText="Code" SortExpression="ConceptCode">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ConceptShName" HeaderText="Short Name" SortExpression="ConceptShName">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ConceptName" HeaderText="Name" SortExpression="ConceptName">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="Active" InsertVisible="False" SortExpression="IsActive" >
                                <ItemStyle Width="40px" HorizontalAlign="Center" />
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
                                        onclientclick="return confirm('Are you sure you want to delete this concept?');" />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newConcept" runat="server" DataKeyNames="ConceptID" 
                        DataSourceID="dsConcept">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 100px; height: 30px;">
                                        <asp:TextBox ID="ConceptCodeTextBox" runat="server" Text='<%# Bind("ConceptCode") %>' 
                                            Width="90%" CssClass="TextBox" MaxLength="10" />
                                        <asp:TextBoxWatermarkExtender ID="wm_ConceptCodeTextBox" runat="server" WatermarkText="Code" TargetControlID="ConceptCodeTextBox" WatermarkCssClass="WaterMark" />
                                        <asp:RequiredFieldValidator ID="req_ConceptCodeTextBox" runat="server" ErrorMessage="This is required field!" ControlToValidate="ConceptCodeTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ex_req_ConceptCodeTextBox" runat="server" TargetControlID="req_ConceptCodeTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 100px; height: 30px;">
                                        <asp:TextBox ID="ConceptShNameTextBox" runat="server" Text='<%# Bind("ConceptShName") %>' 
                                            Width="90%" CssClass="TextBox" MaxLength="10" />
                                        <asp:TextBoxWatermarkExtender ID="wm_ConceptShNameTextBox" runat="server" WatermarkText="Short Name" TargetControlID="ConceptShNameTextBox" WatermarkCssClass="WaterMark" />
                                        <asp:RequiredFieldValidator ID="req_ConceptShNameTextBox" runat="server" ErrorMessage="This is required field!" ControlToValidate="ConceptShNameTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ex_req_ConceptShNameTextBox" runat="server" TargetControlID="req_ConceptShNameTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 294px; height: 30px;">
                                        <asp:TextBox ID="ConceptNameTextBox" runat="server" Text='<%# Bind("ConceptName") %>' 
                                            Width="90%" CssClass="TextBox" MaxLength="150" />
                                        <asp:TextBoxWatermarkExtender ID="wm_ConceptNameTextBox" runat="server" WatermarkText="Name" TargetControlID="ConceptNameTextBox" WatermarkCssClass="WaterMark" />
                                        <asp:RequiredFieldValidator ID="req_ConceptNameTextBox" runat="server" ErrorMessage="This is required field!" ControlToValidate="ConceptNameTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ex_req_ConceptNameTextBox" runat="server" TargetControlID="req_ConceptNameTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 72px; padding-left: 5px;">
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
                                <tr class="GridRow1T">
                                    <td style="width: 496px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 70px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 496px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 70px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsConcept" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="dsConceptTableAdapters.ConceptTableAdapter" 
                        UpdateMethod="Update" >
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ConceptID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ConceptCode" Type="String" />
                            <asp:Parameter Name="ConceptName" Type="String" />
                            <asp:Parameter Name="ConceptShName" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                            <asp:Parameter Name="Original_ConceptID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ConceptCode" Type="String" />
                            <asp:Parameter Name="ConceptName" Type="String" />
                            <asp:Parameter Name="ConceptShName" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" DefaultValue="True" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Concept" />
    </div>
    
  <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />  
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>--%>
    
</asp:Content>
