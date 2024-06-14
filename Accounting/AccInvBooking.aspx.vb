
Partial Class Accounting_AccInvBooking
    Inherits System.Web.UI.Page

    Protected Sub gvMix_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.DataBound
        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        t = p.GetData(Int32.Parse(Request.QueryString(0)))
        If t.Count > 0 Then
            r = t.Rows(0)
            If gvMix.Rows.Count > 0 Then
                gvMix.Columns(9).Visible = r.ChldCategories > 0
                If Not r.IsChld1ShLabelNull Then gvMix.Columns(9).HeaderText = r.Chld1ShLabel
                gvMix.Columns(10).Visible = r.ChldCategories > 1
                If Not r.IsChld2ShLabelNull Then gvMix.Columns(10).HeaderText = r.Chld2ShLabel
                gvMix.Columns(11).Visible = r.ChldCategories > 2
                If Not r.IsChld3ShLabelNull Then gvMix.Columns(11).HeaderText = r.Chld3ShLabel
                gvMix.Columns(12).Visible = r.ChldCategories > 3
                If Not r.IsChld4ShLabelNull Then gvMix.Columns(12).HeaderText = r.Chld4ShLabel
            Else
                Dim l As Label
                For i = 1 To 4
                    l = gvMix.FindControl("lblCh" & i)
                    If l IsNot Nothing Then l.Visible = r.ChldCategories > i - 1
                Next

                If Not String.IsNullOrEmpty(r.Chld1ShLabel) Then
                    If gvMix.FindControl("lblCh1") IsNot Nothing Then CType(gvMix.FindControl("lblCh1"), Label).Text = r.Chld1ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld2ShLabel) Then
                    If gvMix.FindControl("lblCh2") IsNot Nothing Then CType(gvMix.FindControl("lblCh2"), Label).Text = r.Chld2ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld3ShLabel) Then
                    If gvMix.FindControl("lblCh3") IsNot Nothing Then CType(gvMix.FindControl("lblCh3"), Label).Text = r.Chld3ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld4ShLabel) Then
                    If gvMix.FindControl("lblCh4") IsNot Nothing Then CType(gvMix.FindControl("lblCh4"), Label).Text = r.Chld4ShLabel
                End If
            End If
        End If
    End Sub

    Protected Sub gvStay_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvStay.RowUpdated


    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim rindex As Integer = 0
        Dim ib As GridViewRow = CType(sender, ImageButton).NamingContainer

        hfindex.Value = ib.RowIndex


    End Sub
    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            If ex.InnerException IsNot Nothing Then
                popMessage.Text = ex.InnerException.Message
            Else
                popMessage.Text = ex.Message
            End If
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub
    Protected Sub gvDocToApply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvrs1 As GridViewRow = gv.SelectedRow
        Dim gvrs As GridViewRow = gvStay.Rows.Item(hfindex.Value)
       
        If gvrs Is Nothing Then Exit Sub

        Dim txtID As TextBox = gvrs.FindControl("txtDestID")   'gv.NamingContainer.FindControl("txtDocID")
        Dim txt As TextBox = gvrs.FindControl("txtDest")       'gv.NamingContainer.FindControl("txtDoc")
        'Dim txtAm As TextBox = gvrs.FindControl("txtAmount")  'gv.NamingContainer.FindControl("txtAmount")
        txtID.Text = gv.SelectedDataKey.Item(0).ToString
        txt.Text = gv.SelectedDataKey.Item(1).ToString '+ " (" + gv.SelectedDataKey.Item(2).ToString + "-" + gv.SelectedDataKey.Item(3).ToString + ") "


        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub dsStayPay_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsStayPay.Updating
        'Dim trid As Nullable(Of Integer)                    'TransactionID
        'Dim trdt As Nullable(Of Date)                       'TransactionDate
        Dim amnt As Nullable(Of Decimal)                    'Amount
        'Dim apid As Nullable(Of Integer)                    'AppDocID
        Dim usr As String = Membership.GetUser.UserName     'UserName

        Dim q As New dsAccInvoiceTableAdapters.QueriesTableAdapter
        'Dim gvr As GridViewRow = gvStay.Rows(Int32.Parse(hfindex.Value))
        Dim pinvid As Int32 = IIf(invDetail.SelectedValue IsNot Nothing, Int32.Parse(invDetail.SelectedValue), 0)
        Dim psourceid As Int32
        Dim paccDocID As Int32
        Dim ptransid As Int32
        Dim preamount As Decimal
        Dim pdectid As Int32

        Dim gvrs As GridViewRow = gvStay.Rows.Item(hfindex.Value)

        If gvrs Is Nothing Then Exit Sub

        Try
            Dim t As TextBox = gvrs.FindControl("txtDestID")
            pdectid = Integer.Parse(t.Text)
        Catch ex As Exception
            popShow("Document for application not selected.", ex)
            e.Cancel = True
            Exit Sub
        End Try

        'Amount
        Try
            Dim t As TextBox = gvrs.FindControl("txtTransfer")
            preamount = Math.Abs(Double.Parse(t.Text))
        Catch ex As Exception
            popShow("Amount empty or not valid.", ex)
            e.Cancel = True
            Exit Sub
        End Try

        'Amount

        'Dim t1 As Label = gvrs.FindControl("lblAppl")
        'amnt = Math.Abs(Double.Parse(t1.Text))
        'If (preamount > amnt) Then
        '    popShow("Amount not valid", , "Amount has to be lees or equel to applied amount")
        '    e.Cancel = False
        'End If
        

      


        'pdectid = Int32.Parse(txtID.Text)
        'preamount = Int32.Parse(txtAm.Text)
        pinvid = Int32.Parse(invDetail.SelectedValue)
        paccDocID = IIf(gvrs.FindControl("lblDocID") IsNot Nothing, Int32.Parse(CType(gvrs.FindControl("lblDocID"), Label).Text), 0)
        psourceid = IIf(gvrs.FindControl("lblSourceID") IsNot Nothing, Int32.Parse(CType(gvrs.FindControl("lblSourceID"), Label).Text), 0)
        ptransid = IIf(gvrs.FindControl("lblTransID") IsNot Nothing, Int32.Parse(CType(gvrs.FindControl("lblTransID"), Label).Text), 0)


        e.InputParameters("SourceID") = psourceid
        'e.InputParameters("InvoiceID") = ptransid
        e.InputParameters("TransID") = ptransid
        e.InputParameters("AccDocID") = paccDocID
        e.InputParameters("DestID") = pdectid
        e.InputParameters("TrAmount") = preamount
    End Sub

    Protected Sub dsStayPay_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStayPay.Updated
        If e.Exception IsNot Nothing Then
            popShow("Error Editing", e.Exception)
        Else
            gvMix.DataBind()
            gvStay.DataBind()
        End If
    End Sub

    Protected Sub gvStay_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvStay.RowUpdating
        

    End Sub
End Class
