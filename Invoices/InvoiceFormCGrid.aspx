<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InvoiceFormCGrid.aspx.vb"
    Inherits="Invoices_InvoiceFormCGrid" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dumyConceptCancel').click();
        }
        function okay() {
            window.parent.document.getElementById('dumyConceptOK').click();
        }
    </script>

</head>
<body>
    <form id="form_S" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="Green" style="background-color: Transparent; vertical-align: bottom;">
        <div class="GridLabelBG" style="width: 500px; overflow: hidden;">
            <div style="float: left; position: absolute; left: 10px; vertical-align: middle; padding-right: 3px; display: inline;">
                <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                    ImageUrl="~/Images/cancel_big.gif" OnClientClick="cancel();" />
            </div>
            <asp:Label ID="lblTitle" runat="server" Text="Avalilable Concepts" CssClass="GridLabel" Height="26px" />
        </div>
        <asp:Panel ID="pnlRates" runat="server" ScrollBars="Vertical" style="table-layout: fixed; width: 530px; max-width: 1300px; max-height: 500px;">
            <div style="table-layout: fixed; overflow: visible;">
                <table id="Rates" cellpadding="0" cellspacing="0" style="background-color: White;">
                    <tr>
                        <td class="GridBorder" style="vertical-align: top; border-bottom: none;">
                            <asp:GridView ID="gvConcepts" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="ConceptID" BorderStyle="None" DataSourceID="dsConcepts">
                                <RowStyle CssClass="GridRow1B" Wrap="False" />
                                <SelectedRowStyle CssClass="SelectRow1TB" Wrap="False" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Code">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibSelect" runat="server" CommandName="Edit" ToolTip="Add concept" 
                                                ImageUrl="~/Images/select_.gif" Visible='<%# Eval("IsActive") %>'  />
                                            <asp:LinkButton ID="lnkRateID" runat="server" CommandName="Edit" ToolTip="Add concept"  
                                                Text='<%# Eval("ConceptCode") %>' Visible='<%# Eval("IsActive") %>' />
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" ToolTip="Already added"  
                                                Text='<%# Eval("ConceptCode") %>' Visible='<%# Not Eval("IsActive") %>'
                                                Enabled="false" style="padding-left: 19px;" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Image ID="eibSelect" runat="server" ImageUrl="~/Images/select_.gif" />
                                            <asp:Label ID="elnkRateID" runat="server" Text='<%# Eval("ConceptCode") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sh.Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbRate" runat="server" CommandName="Edit" ToolTip="Add concept" 
                                                Text='<%# Eval("ConceptShName") %>' Enabled='<%# Eval("IsActive") %>' 
                                                Style="padding: 0px 3px 0px 3px;" Width="80px" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lbRate" runat="server" Text='<%# Eval("ConceptShName") %>' Style="padding: 0px 3px 0px 3px;" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Label100" runat="server" Text='<%# Eval("ConceptName") %>' Enabled='<%# Eval("IsActive") %>' CommandName="Edit" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAmount" runat="server" Width="100px" CssClass="TextBox"/>
                                            <asp:CompareValidator ID="dec_txtAmount" runat="server" ControlToValidate="txtAmount"
                                                Display="None" ErrorMessage="Please input a valid amount" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="ex_dec_txtAmount" runat="server"
                                                Enabled="True" TargetControlID="dec_txtAmount" />
                                            <asp:RequiredFieldValidator ID="req_txtAmount" runat="server" ControlToValidate="txtAmount" 
                                                Display="None" ErrorMessage="Required field!" />
                                            <asp:ValidatorCalloutExtender ID="ex_req_txtAmount" runat="server"
                                                Enabled="True" TargetControlID="req_txtAmount" />
                                            <asp:LinkButton ID="lnkApply" runat="server" CommandName="AddConcept" Text="Apply" CommandArgument='<%# Eval("ConceptID") %>'
                                                style="padding-left: 5px; font-weight: bold;" />
                                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" style="padding-left: 25px;" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="300px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="width: 500px; text-align: center; font-weight: bold; font-style: italic;">
                                        - NO ACTIVE CONCEPTS -
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="vertical-align: top; border-top: none;">
                            <asp:Label ID="lblError" runat="server" Text="Label" style="text-align: center; font-weight: bold; color: Red; width: 500px;" Visible="False" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsConcepts" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActiveByStay" 
        TypeName="dsConceptTableAdapters.ConceptTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
        <SelectParameters>
            <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" 
                Type="Int32" />
            <asp:QueryStringParameter Name="DetailId" QueryStringField="DetailID" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="ConceptCode" Type="String" />
            <asp:Parameter Name="ConceptName" Type="String" />
            <asp:Parameter Name="ConceptShName" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
