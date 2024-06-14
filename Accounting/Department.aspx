<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Department.aspx.vb" Inherits="Accounting_Department" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function closeMe() {
            window.parent.document.getElementById('DepartmentOK').click();
        }
    </script>
</head>
<body>
    <form id="form_E" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <asp:HiddenField ID="hfDocument" runat="server" />
    <div class="Blue" style="background-color: Transparent; vertical-align: bottom; width: 500px;">
        <div class="GridLabelBG" style="overflow: hidden;">
            <asp:ImageButton ID="ibClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                style="float: right; background: white; border-radius: 10px; margin: 3px;" 
                ImageUrl="~/Images/cancel_big.gif" OnClientClick="closeMe();" />
            <asp:Label ID="lblTitle" runat="server" Text="Change Responsible" CssClass="GridLabel" Height="26px" />
        </div>
        <asp:Panel ID="pnlCharge" runat="server" Style="table-layout: fixed;">
            <div style="table-layout: fixed; overflow: visible; border: solid 2px; padding: 5px; background-color: White;">
                <asp:FormView ID="fvDocDetail" runat="server" DataKeyNames="DocumentID" DataSourceID="dsAccTransDoc" DefaultMode="Edit">
                    <EditItemTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 100px; padding-left: 4px;"> Department </td>
                                <td class="GridRow1B" style="width: 400px;" >
                                    <asp:DropDownList ID="ddlDep" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exDep" runat="server" 
                                        TargetControlID="ddlDep" Category="DepID" 
                                        ServicePath="~/DepEmp.asmx"
                                        ServiceMethod="GetDepID"
                                        SelectedValue='<%# Bind("DepID") %>' 
                                        UseContextKey="true"
                                        ContextKey="">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="padding-left: 4px;"> Employee </td>
                                <td class="GridRowClear" >
                                    <asp:DropDownList ID="ddlEmp" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exEmp" runat="server" 
                                        ParentControlID="ddlDep"
                                        TargetControlID="ddlEmp" Category="EmpID" 
                                        ServicePath="~/DepEmp.asmx"
                                        ServiceMethod="GetEmpID"
                                        SelectedValue='<%# Bind("EmpID") %>' >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow2T" style="text-align: right; padding-top: 5px;" colspan="2">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" CommandName="UpdateDoc" style="margin-left: 5px;"/>
                                    <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel" CommandName="Cancel" CausesValidation="False" OnClientClick="closeMe();"/>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:ObjectDataSource ID="dsAccTransDoc" runat="server" 
                    TypeName="dsAccRegistrationTableAdapters.AccTransDocumentTableAdapter" 
                    SelectMethod="GetData" OldValuesParameterFormatString="original_{0}">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:Panel ID="pnlError" runat="server" Visible="false" style="margin: 5px; padding: 10px; border: solid 2px;" CssClass="Red" >
                    <asp:Label ID="lblError" runat="server" Text="Error:" Font-Bold="true" /><br />
                    <div style="padding-left: 10px;">
                        <asp:Label ID="lblErrMsg" runat="server" Text="" />
                    </div>
                </asp:Panel>
            </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
