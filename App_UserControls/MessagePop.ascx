<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MessagePop.ascx.vb" Inherits="App_UserControls_MessagePop" %>

<asp:HiddenField ID="hfAction" runat="server" />
<asp:ModalPopupExtender ID="popMsgBox" runat="server" PopupControlID="pnlMsgBox"
    PopupDragHandleControlID="popTitle" CancelControlID="btnMsgBoxNo" DropShadow="True"
    BackgroundCssClass="modalBackground" TargetControlID="hfAction" X="120" Y="200"
    BehaviorID="MessagePop" >
</asp:ModalPopupExtender>
<asp:Panel ID="pnlMsgBox" runat="server" Width="400px" BackColor="White" Style="display: none">
    <div style="width: 100%;">
        <div class="GridLabelBG" >
            <asp:Label ID="popTitle" runat="server" Text="Title" SkinID="skGridLabel" />
        </div>
        <div class="GridBorder" style="text-align: left;">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="vertical-align: top; text-align: left; padding: 5px; width: 24px;">
                        <asp:Image ID="popImage" runat="server" ImageUrl="~/App_UserControls/no-entry.png"/>
                    </td>
                    <td style="vertical-align: middle; text-align: center; padding: 5px;">
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                    </td>
                </tr>
                <tr>
                    <td class="GridRowClear" style="text-align: right; padding-top: 10px; padding-bottom: 5px; border-top: 1px solid;" colspan="2">
                        <asp:Button ID="btnMsgBoxYes" runat="server" Text="Yes" SkinID="skBtnBase" Width="80px" OnClientClick="{$find('MessagePop').hide();}" />
                        <asp:Button ID="btnMsgBoxNo" runat="server" Text="No" SkinID="skBtnBase" Width="80px" style="margin-left: 10px;" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>

