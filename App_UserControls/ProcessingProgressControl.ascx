<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ProcessingProgressControl.ascx.vb" Inherits="App_UserControls_ProcessingProgressControl" %>

<script type="text/javascript">
    function adjustDivs(){
        var df = document.getElementById('<%=upProcessing.ClientID %>');
        df.style.position = 'absolute';
        df.style.height = '100%';
        df.style.width = '100%';
        df.style.left = (document.documentElement.scrollLeft+5) + '%';
        df.style.top = (document.documentElement.scrollTop + 50) + 'px';

        var divf = document.getElementsByClassName('processdiv')[0];
        divf.style.top = (document.documentElement.scrollTop > 0 ? '0' : '53px');
        divf.style.height = (document.documentElement.scrollTop > 0 ? '100%' : '95%');
    }
    window.onload = adjustDivs;
    window.onpageshow = adjustDivs;
    window.onresize=adjustDivs;
    window.onscroll=adjustDivs;
</script>
<asp:UpdateProgress ID="upProcessing" runat="server" >
    <ProgressTemplate>
        <div id="Div1" class="processdiv" >
            <div class="SelectRow1TB" style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" style="margin-right: 10px;" /><b>Processing...</b>
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>

