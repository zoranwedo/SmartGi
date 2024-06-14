<%@ Page Title="" Language="VB" MasterPageFile="~/Invoices/masterInvoice.master" AutoEventWireup="false" CodeFile="RateChangeLog.aspx.vb" Inherits="Invoices_RateChangeLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <p>
        Reservations Rate Flaw</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="2px" cellspacing="0">
            <%--<tr style="text-decoration: underline; background-color: #8CF2FF">--%>
            <tr class="SelectRowClear" style="text-decoration: underline;">
                <th style="width: 100px;" class="GridRow1TBL">
                    <asp:LinkButton ID="lbReservation" runat="server">Reservation</asp:LinkButton>
                </th>
                <th style="width: 100px;" class="GridRow1TBL">Folio</th>
                <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Hotel</th>
                <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Tour Operator</th>
                <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">CheckIn</th>
                <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">CheckOut</th>
                <th style="width: 250px;" rowspan="2" class="GridRow1T6B1L">Name</th>
                <th style="width: 50px;" rowspan="2" class="GridRow1T6B1L">MP</th>
                <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Rate Code</th>
                <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Room Type</th>
                <th style="width: 60px;" rowspan="2" class="GridRow1T6B1L"></th>
                <th style="width: 120px;" class="GridRow1TRBL">Processed</th>
            </tr>
            <tr class="SelectRowClear" style="text-decoration: underline;">
                <th class="GridRow6B1L" style="text-align: right;">Invoice</th>
                <th class="GridRow6B1L" style="text-align: right;">Number</th>
                <th class="GridRow1R6B1L" style="text-align: right;">Current State</th>
            </tr>
            <tr>
                <td class="GridRow1BL">(ResID)</td>
                <td class="GridRow1BL">FolioFull</td>
                <td class="GridRow1BL">HotelHID</td>
                <td class="GridRow1BL">TourOpHID</td>
                <td class="GridRow1BL">CheckIn</td>
                <td class="GridRow1BL">CheckOut</td>
                <td class="GridRow1BL">LastName *</td>
                <td class="GridRow1BL">TipoTar</td>
                <td class="GridRow1BL">RoomTypeHID</td>
                <td class="GridRow1BL">RateHID</td>
                <td class="GridRow1BL">Res.</td>
                <td class="GridRow1RBL">Created</td>
            </tr>
            <tr>
                <td rowspan="3" class="GridRow2B1L">(InvoiceID)</td>
                <td rowspan="3" class="GridRow2B1L">InvNumber</td>
                <td rowspan="3" colspan="4" class="GridRow2B1L">
                    <table cellpadding="2" cellspacing="0">
                        <tr>
                            <td style="width: 360px; border-bottom: solid 1px;" colspan="2">Hotel ...</td>
                        </tr>
                        <tr>
                            <td style="width: 100px;">&nbsp;</td>
                            <td >TourOp ...</td>
                        </tr>
                    </table>              
                </td>
                <td rowspan="3" class="GridRow2B1L">DetText</td>
                <td rowspan="3" class="GridRow2B1L">MealPlanID</td>
                <td class="GridRow1BL">insRoomTypeId</td>
                <td class="GridRow1BL">RateCodeId</td>
                <td class="GridRow1BL"><i>Ins.</i></td>
                <td rowspan="3" class="GridRow1R2B1L">InvoiceState</td>
            </tr>
            <tr>
                <td class="GridRow1BL">htlRoomTypeId</td>
                <td class="GridRow1BL">insRateCodeId</td>
                <td class="GridRow1BL"><i>From Htl.</i></td>
            </tr>
            <tr>
                <td class="GridRow2B1L">RoomTypeId</td>
                <td class="GridRow2B1L">htlRateCodeId</td>
                <td class="GridRow2B1L"><i>Current</i></td>
            </tr>
            <tr>
                <td class="GridRow1BL">(ResID)</td>
                <td class="GridRow1BL">FolioFull</td>
                <td class="GridRow1BL">HotelHID</td>
                <td class="GridRow1BL">TourOpHID</td>
                <td class="GridRow1BL">CheckIn</td>
                <td class="GridRow1BL">CheckOut</td>
                <td class="GridRow1BL">LastName *</td>
                <td class="GridRow1BL">TipoTar</td>
                <td class="GridRow1BL">RoomTypeHID</td>
                <td class="GridRow1BL">RateHID</td>
                <td class="GridRow1BL">Res.</td>
                <td class="GridRow1RBL">Created</td>
            </tr>
            <tr>
                <td rowspan="3" class="GridRow2B1L">(InvoiceID)</td>
                <td rowspan="3" class="GridRow2B1L">InvNumber</td>
                <td rowspan="3" colspan="4" class="GridRow2B1L">
                    <table cellpadding="2" cellspacing="0">
                        <tr>
                            <td style="width: 360px; border-bottom: solid 1px;" colspan="2">Hotel ...</td>
                        </tr>
                        <tr>
                            <td style="width: 100px;">&nbsp;</td>
                            <td >TourOp ...</td>
                        </tr>
                    </table>              
                </td>
                <td rowspan="3" class="GridRow2B1L">DetText</td>
                <td rowspan="3" class="GridRow2B1L">MealPlanID</td>
                <td class="GridRow1BL">insRoomTypeId</td>
                <td class="GridRow1BL">RateCodeId</td>
                <td class="GridRow1BL"><i>Ins.</i></td>
                <td rowspan="3" class="GridRow1R2B1L">InvoiceState</td>
            </tr>
            <tr>
                <td class="GridRow1BL">htlRoomTypeId</td>
                <td class="GridRow1BL">insRateCodeId</td>
                <td class="GridRow1BL"><i>From Htl.</i></td>
            </tr>
            <tr>
                <td class="GridRow2B1L">RoomTypeId</td>
                <td class="GridRow2B1L">htlRateCodeId</td>
                <td class="GridRow2B1L"><i>Current</i></td>
            </tr>
        </table>
    
    
    </div>
</asp:Content>

