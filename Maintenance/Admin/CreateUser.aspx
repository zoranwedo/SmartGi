<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="CreateUser.aspx.vb" Inherits="Maintenance_Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 402px">
                    <asp:Label ID="lblPayMode" runat="server" Text="Create New Accout" 
                        SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 402px">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                        CancelDestinationPageUrl="~/Maintenance/Admin/Admin.aspx" DisplayCancelButton="True" 
                        Font-Names="Verdana" Font-Size="10pt" 
                        Height="157px" LoginCreatedUser="False" MembershipProvider="SmartProvider" 
                        StepPreviousButtonText="" Width="450px">
                        <SideBarStyle BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                        <SideBarButtonStyle BorderWidth="0px" />
                        <FinishNavigationTemplate>
                            &nbsp;
                        </FinishNavigationTemplate>
                        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                            ForeColor="#284775" />
                        <HeaderStyle CssClass="HeaderRow" Font-Bold="True" Wrap="True" />
                        <CreateUserButtonStyle CssClass="Button" ForeColor="White" Height="25px" />
                        <StepNavigationTemplate>
                            step
                        </StepNavigationTemplate>
                        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <StartNextButtonStyle CssClass="Button" />
                        <StepStyle BorderWidth="0px" />
                        <CancelButtonStyle CssClass="Button" ForeColor="White" Height="25px" />
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateAccount" runat="server">
                                <ContentTemplate>
                                    <TABLE border="0" style="FONT-SIZE: 100%; FONT-FAMILY: Verdana">
                                        <tbody>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User 
                                                    Name:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="UserName" runat="server" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                        AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                                        Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                        ControlToValidate="ConfirmPassword" 
                                                        ErrorMessage="Confirm Password is required." 
                                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="Email" runat="server" Width="250px"></asp:TextBox>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" 
                                                        Visible="False">Security Question:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="Question" runat="server" Visible="False" Width="250px"></asp:TextBox>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" 
                                                        Visible="False">Security Answer:</asp:Label>
                                                </td>
                                                <td style="width: 293px">
                                                    <asp:TextBox ID="Answer" runat="server" Visible="False" Width="250px"></asp:TextBox>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="HEIGHT: 18px">
                                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The Password and Confirmation Password must match." 
                                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="COLOR: red; HEIGHT: 17px">
                                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </TABLE>
                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:WizardStep ID="RolesAcount" runat="server" Title="Set Up Roles">
                                <table border="0" style="FONT-SIZE: 100%; FONT-FAMILY: Verdana">
                                    <tbody>
                                        <tr>
                                            <td style="FONT-WEIGHT: bold; width: 360px;">
                                                New account has been successfully created.<br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2" style="height: 22px;" valign="top">
                                                <asp:Label ID="lblRole" runat="server" Height="16px" SkinID="TitleLabel" 
                                                    Text="Roles for Created User" Width="180px"></asp:Label>
                                                <asp:CheckBoxList ID="RoleList" runat="server" Width="180px">
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2" style="height: 22px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2" style="height: 10px;">
                                                <asp:Button ID="ContinueButton" runat="server" BackColor="#FFFBFF" 
                                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                                    CausesValidation="False" CommandName="Continue" CssClass="ButtonLogin" 
                                                    Font-Names="Verdana" ForeColor="White" Text="Set Roles" 
                                                    ValidationGroup="CreateUserWizard1" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </asp:WizardStep>
                            <asp:CompleteWizardStep ID="RolesSetup" runat="server" 
                                Title="New account created">
                                <ContentTemplate>
                                    <table border="0" 
                                        style="font-size: 100%; width: 463px; font-family: Verdana; height: 208px">
                                        <tbody>
                                            <tr>
                                                <td align="center" class="GridRow2B" colspan="2" 
                                                    style="font-weight: bold; color: #006699; height: 23px;">
                                                    New account created</td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <b>Don&#39;t forget to set up hotels and TO for created user.</b></td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ButtonLogin" 
                                                        Font-Underline="False" ForeColor="White" Height="22px" 
                                                        NavigateUrl="~/Maintenance/Admin/Admin.aspx" 
                                                        Style="text-align: center; vertical-align: middle;" Width="100px">Finish</asp:HyperLink>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

