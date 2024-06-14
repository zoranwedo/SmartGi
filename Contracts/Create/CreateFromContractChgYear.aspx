<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Create/masterNewCnt.master" AutoEventWireup="false" CodeFile="CreateFromContractChgYear.aspx.vb" Inherits="Contracts_Create_CreateFromContractChgYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Create Contract From Contract Changing Year
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CreateCntContent" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="650px" 
        SkinID="WizardTemp" Width="900px">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" title="Contracts" 
                StepType="Start">
                  <div class="Green">
 
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="PnlContract" runat="server" >
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="Label2" runat="server" SkinID="skGridLabel">
                            Search/Filter
                            &nbsp;
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />
                         

                         


                         

                         



                         

                         


                         

                         




                         

                         


                         

                         



                         

                         


                         

                         


                         

                         


                         

                         



                         

                         


                         

                         




                         

                         


                         

                         



                         

                         


                         

                         &nbsp;
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="Panel2" runat="server"  >
                        <table cellpadding="0" cellspacing="0" >
                            <tr>
                                <td class="GridRow1B" style="width: 100px; text-align: left;">
                                    Contract ID</td>
                                <td class="GridRow1B" style="width: 400px" align="left">
                                    <asp:TextBox ID="txtContID" runat="server" CssClass="TextBox" Width="400px"></asp:TextBox>
                                    
                                    <asp:ObjectDataSource ID="dsUserContracts" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataByUser" 
                                        TypeName="ContractsTableAdapters.ContractTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Template" Type="Boolean" />
                                            <asp:Parameter Name="HotelId" Type="Int32" />
                                            <asp:Parameter Name="MarketId" Type="String" />
                                            <asp:Parameter Name="Start" Type="DateTime" />
                                            <asp:Parameter Name="Finish" Type="DateTime" />
                                            <asp:Parameter Name="Commision" Type="Decimal" />
                                            <asp:Parameter Name="Title" Type="String" />
                                            <asp:Parameter Name="Year" Type="Int16" />
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="StateId" Type="Int32" />
                                            <asp:Parameter Name="CopyId" Type="Int32" />
                                            <asp:Parameter Name="TourOpId" Type="Int32" />
                                            <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                                PropertyName="Value" Type="String" />
                                            <asp:Parameter DefaultValue="" Name="Template" Type="Boolean" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Template" Type="Boolean" />
                                            <asp:Parameter Name="HotelId" Type="Int32" />
                                            <asp:Parameter Name="MarketId" Type="String" />
                                            <asp:Parameter Name="Start" Type="DateTime" />
                                            <asp:Parameter Name="Finish" Type="DateTime" />
                                            <asp:Parameter Name="Commision" Type="Decimal" />
                                            <asp:Parameter Name="Title" Type="String" />
                                            <asp:Parameter Name="Year" Type="Int16" />
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="StateId" Type="Int32" />
                                            <asp:Parameter Name="CopyId" Type="Int32" />
                                            <asp:Parameter Name="TourOpId" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                             
                                </td>
                                <td class="ComandRow2b" style="width: 100px; text-align:right;" rowspan="2">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach"/>
                                </td>
                           </tr>
                            <tr>
                                <td class="ComandRow2b" style="width: 100px;" align="left">
                                    ContractName</td>
                                <td align="left" class="ComandRow2b" style="width: 400px">
                                    <asp:DropDownList ID="ddlContracts" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsUserContracts" 
                                        DataTextField="Title" DataValueField="ContractID">
                                        <asp:ListItem Value="">all contracts</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Title</td>
                                <td class="GridRow1B" >
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltName" 
                                        WatermarkCssClass="WaterMark" 
                                        WatermarkText="Contract title (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B" ></td>
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B">
                                 <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="ObjectDataSource1" DataTextField="Market" 
                                        DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" 
                                        UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_MarketID" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Market" Type="String" />
                                            <asp:Parameter Name="Original_MarketID" Type="String" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="MarketID" Type="String" />
                                            <asp:Parameter Name="Market" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                               
                                <td class="GridRow1B" ></td>
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Hotel
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox"
                                        DataSourceID="dsUserHotels"
                                        DataTextField="Hotel" DataValueField="HotelID" 
                                        AppendDataBoundItems="True" >
                                        <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsUserHotels" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" 
                                        TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                                PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B" ></td>
                           </tr>
                            <tr>
                                <td class="GridRow1B" >
                                    Tour Operator</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsTO" DataTextField="TourOp" 
                                        DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTO" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                                PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B" >
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >
                                    Year</td>
                                <td class="GridRow1B" >
                                    <asp:TextBox ID="fltYear" runat="server" CssClass="TextBox" MaxLength="4" />
                                    <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                        ControlToValidate="fltYear" ErrorMessage="Must input 4-digit number" 
                                        Operator="DataTypeCheck" Type="Integer" Display="None"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator6_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="CompareValidator6">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td class="GridRow1B" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >
                                    Start</td>
                                <td class="GridRow1B" >
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="fltStart" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >
                                    End</td>
                                <td class="GridRow1B" >
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="fltFinish" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B" >
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >
                                    State</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsCntState" DataTextField="ContractState" 
                                        DataValueField="ContractStateID">
                                        <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsCntState" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" 
                                        TypeName="ContractsTableAdapters.ContractStateTableAdapter" 
                                        UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ContractStateID" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ContractState" Type="String" />
                                            <asp:Parameter Name="ContractStateDesc" Type="String" />
                                            <asp:Parameter Name="Original_ContractStateID" Type="Int32" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ContractStateID" Type="Int32" />
                                            <asp:Parameter Name="ContractState" Type="String" />
                                            <asp:Parameter Name="ContractStateDesc" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B" >
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td class="GridRowClear"></td>
                                <td class="GridRowClear">
                                </td>
                                <td class="GridRowClear"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T">
                                    <asp:Button ID="Button3" runat="server" SkinID="skBtnFilter"/>&nbsp;
                                    <asp:Button ID="Button4" runat="server" SkinID="skBtnClear"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            
        </table>

    </div>
        <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbHotels" runat="server" Text="Contracts" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvContracts" runat="server" 
                                  DataSourceID="dsFilteredContracts" DataKeyNames="ContractID,Title"
                                  SkinID="skGridView" AutoGenerateColumns="False" 
                        AllowPaging="True" SelectedIndex="0">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" />
                            <asp:TemplateField SortExpression="ContractID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContractID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    (<asp:Label ID="Label1" runat="server" Text='<%# Bind("ContractID") %>'></asp:Label>
                                    )
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="Market" 
                                SortExpression="MarketId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" 
                                SortExpression="TourOpId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Start" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="Start" HtmlEncode="False" SortExpression="Start">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="End" HtmlEncode="False" SortExpression="Finish">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" 
                        DeleteMethod="Delete" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForFilterByID" 
                        TypeName="ContractsTableAdapters.ContractTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContractID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Template" Type="Boolean" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="Commision" Type="Decimal" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Year" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="StateId" Type="Int32" />
                            <asp:Parameter Name="CopyId" Type="Int32" />
                            <asp:Parameter Name="TourOpId" Type="Int32" />
                            <asp:Parameter Name="Original_ContractID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="false" Name="Template" Type="Boolean" />
                            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="fltYear" Name="Year" PropertyName="Text" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" 
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" 
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="ddlState" Name="StateId" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtContID" Name="ContractID" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" title="Parameters">
<div class= "Red">
                      <asp:Panel ID="Panel3" runat="server">
                    <table>
                    <tr>
                <td class="GridLabelBG"  colspan=2>
                    <asp:Label ID="Label11" runat="server" Text="Contracts Parameters" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
                    <tr>
                    <td style="width: 89px" class="GridRow1B">
                    Year
                    </td>
                    <td style="width: 400px" class="GridRow1B">
                    
                        <asp:TextBox ID="txtYear" runat="server" AutoPostBack="True" CssClass="TextBox" 
                            MaxLength="4"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator7" runat="server" 
                            ControlToValidate="txtYear" Display="None" ErrorMessage="Four digit input" 
                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator7">
                        </asp:ValidatorCalloutExtender>
                    
                    </td>
                    </tr> 
                    <tr>
                    <td style="width: 89px" class="GridRow1B">
                    Title
                    </td>
                    <td style="width: 400px" class="GridRow1B">
                    
                        <asp:DropDownList ID="ddlTitle" runat="server" CssClass="TextBox" 
                            DataSourceID="dsCntTitle" DataTextField="ContractTitle" 
                            DataValueField="ContractTitle">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="dsCntTitle" runat="server" DeleteMethod="Delete" 
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetDataByYear" 
                            TypeName="ContractsTableAdapters.ContractTitleTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_ContractTitle" Type="String" />
                                <asp:Parameter Name="Original_ContractYear" Type="Int16" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Original_ContractTitle" Type="String" />
                                <asp:Parameter Name="Original_ContractYear" Type="Int16" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtYear" Name="ContractYear" 
                                    PropertyName="Text" Type="Int16" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ContractTitle" Type="String" />
                                <asp:Parameter Name="ContractYear" Type="Int16" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    
                    </td>
                    </tr>
                    <tr>
                    <td style="width: 89px" class="GridRow1B">
                    Rate Change
                    </td>
                    <td style="width: 400px" class="GridRow1B">
                    
                        <asp:TextBox ID="txtRateChange" runat="server" CssClass="TextBox"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtRateChange_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="txtRateChange" 
                            WatermarkCssClass="WaterMark" WatermarkText="specified rate modification (%)">
                        </asp:TextBoxWatermarkExtender>
                        <asp:CompareValidator ID="CompareValidator8" runat="server" 
                            ControlToValidate="txtRateChange" Display="None" ErrorMessage="Number input" 
                            Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator8">
                        </asp:ValidatorCalloutExtender>
                    
                    </td>
                    </tr>
                    <tr>
                                <td class="GridRowClear"></td>
                                <td class="GridRowClear">
                                </td>
                                <td class="GridRowClear"></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T">
                                 
                                    <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" 
                                        Text="Create Contract" />
                                 
                                </td>
                            </tr>
                    </table>
                                        
                    </asp:Panel>
                    </div>
            </asp:WizardStep>
        </WizardSteps>
        <HeaderTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" >
                        <tr style="font-size: x-small;">
                            <td style="width:70px;" align="right" >Contract:&nbsp;&nbsp;</td>
                            <td ><%=gvContracts.SelectedValue%></td>
                        </tr>
                       </table> 
                </HeaderTemplate>
        <SideBarStyle Width="110px" Wrap="True" />
    </asp:Wizard>
     <asp:ObjectDataSource runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.MarketTableAdapter" UpdateMethod="Update" 
        ID="dsMarkets"><DeleteParameters>
<asp:Parameter Name="Original_MarketID" Type="String"></asp:Parameter>
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="MarketID" Type="String"></asp:Parameter>
<asp:Parameter Name="Market" Type="String"></asp:Parameter>
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="Market" Type="String"></asp:Parameter>
<asp:Parameter Name="Original_MarketID" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ContractsTableAdapters.ContractTableAdapter" UpdateMethod="Update" 
        ID="dsContract">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_ContractID" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Template" Type="Boolean" DefaultValue="false"></asp:Parameter>
                                        <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="MarketId" Type="String"></asp:Parameter>
                                        <asp:Parameter DefaultValue="" Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                        <asp:Parameter Name="Commision" Type="Decimal" />
                                        <asp:Parameter Name="Title" Type="String" />
                                        <asp:Parameter Name="Year" Type="Int16" />
                                        <asp:Parameter Name="Description" Type="String" DefaultValue="" />
                                        <asp:Parameter Name="StateId" Type="Int32" DefaultValue="-1"></asp:Parameter>
                                        <asp:Parameter Name="CopyId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Template" Type="Boolean"></asp:Parameter>
                                        <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="MarketId" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
                                        <asp:Parameter Name="Finish" Type="DateTime"></asp:Parameter>
                                        <asp:Parameter Name="Commision" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Year" Type="Int16"></asp:Parameter>
                                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="StateId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="CopyId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="Original_ContractID" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsContractTitle" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="ContractsTableAdapters.ContractTitleTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ContractTitle" Type="String" />
            <asp:Parameter Name="Original_ContractYear" Type="Int16" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Original_ContractTitle" Type="String" />
            <asp:Parameter Name="Original_ContractYear" Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ContractTitle" Type="String" />
            <asp:Parameter Name="ContractYear" Type="Int16" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    <div class = "Blue">
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
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
                        <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="GridRow2T">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>

    </div>
</asp:Content>

