Imports App_UserControls_MessagePop

Partial Class Accounting_AccRegistrationDoc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetNoStore()
        Response.Cache.AppendCacheExtension("no-cache")
        Response.Expires = 0
        If Not (Page.IsPostBack) Then
            txtDate.Text = LogDateInic.GetDateInit.ToShortDateString 'Today.ToShortDateString
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim trCode As String = ddlDocType.SelectedValue
        Dim hotelID As Integer = ctrlHotel.SelectedHotel
        Dim ttooID As Integer = ctrlTourOp.SelectedTourOp
        Dim userName As String = My.User.Name
        Dim statistic As Boolean = False

        If Not String.IsNullOrEmpty(txtDate.Text) Then
            Dim chkdt As Date
            chkdt = Date.Parse(txtDate.Text)

            Dim statusQ As New dsAccountingTableAdapters.SelectAccRegStatusTableAdapter
            Dim statusRow As dsAccounting.SelectAccRegStatusRow = statusQ.GetData(trCode, hotelID, chkdt, userName).Rows(0)

            Dim statQ As New dsAccountTableAdapters.AccDocumentTableAdapter
            Dim statRow As dsAccount.AccDocumentRow = statQ.GetDataByCode(trCode).Rows(0)

            'If statRow.Approvable And Not (My.User.IsInRole("accounting_adjustment") Or My.User.IsInRole("admin")) Then
            '    msgPop.ShowPrompt("You don't have sufficient rights to register this document!")
            '    Return
            'End If

            If Not statusRow.isACNT Then txtBankCharge.Text = String.Empty
            If (Not statusRow.IsPrecentNull And String.IsNullOrEmpty(txtHPercent.Text)) Then txtHPercent.Text = statusRow.Precent
            txtHAmount.Text = Decimal.Parse(txtAmount.Text) * Decimal.Parse(txtHPercent.Text) / 100
            'txtHAmount.Enabled = statusRow.editHAmount
            'txtHPercent.Enabled = statusRow.editHAmount

            pnlInsert.Enabled = False
            pnlAcount.Visible = statusRow.isACNT
            pnlHotel.Visible = statusRow.editHAmount
            pnlInvoice.Visible = True
            pnlStatistic.Visible = statRow.Statistic

            btnUpdate.Visible = False
            btnRegister.Visible = True
            btnCancel.Visible = True
        Else
            msgPop.ShowPrompt("You must input all parameters!")
        End If

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Dim reg As New dsAccountingTableAdapters.QueriesTableAdapter
        Try
            Dim pDocCode As String = ddlDocType.SelectedValue
            'Dim pDocDate As DateTime = DateTime.Parse(txtDate.Text)
            Dim pDocDate As DateTime = AccDocDate()
            Dim pHotelID As Integer = ctrlHotel.SelectedHotel
            Dim pTourOpID As Integer = ctrlTourOp.SelectedTourOp
            Dim pAmount As Decimal = Decimal.Parse(txtAmount.Text)
            Dim pPayModeID As String = Nothing : If Not String.IsNullOrEmpty(ddlPayMode.SelectedValue) Then pPayModeID = ddlPayMode.SelectedValue
            Dim pBAmount As Nullable(Of Decimal) : If Not String.IsNullOrEmpty(txtBankCharge.Text) Then pBAmount = Decimal.Parse(txtBankCharge.Text)
            Dim pHAmount As Nullable(Of Decimal) : If Not String.IsNullOrEmpty(txtHAmount.Text) Then pHAmount = Decimal.Parse(txtHAmount.Text)
            Dim pHPercent As Nullable(Of Decimal) : If Not String.IsNullOrEmpty(txtHPercent.Text) Then pHPercent = Decimal.Parse(txtHPercent.Text)
            Dim pReference As String = txtReference.Text
            Dim pNote As String = txtNote.Text
            Dim pUserName As String = Membership.GetUser.UserName
            Dim pDocID As Integer = 0
            Dim pDepID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then pDepID = Decimal.Parse(ddlDep.SelectedValue)
            Dim pEmpID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then pEmpID = Decimal.Parse(ddlEmp.SelectedValue)
            Dim pNights As Nullable(Of Integer) : If txtNights.HasValue Then pNights = txtNights.IntegerValue
            Dim pAdultPax As Nullable(Of Integer) : If txtAPax.HasValue Then pAdultPax = txtAPax.IntegerValue
            Dim pChildPax As Nullable(Of Integer) : If txtCPax.HasValue Then pChildPax = txtCPax.IntegerValue
            Dim pMP As String = Nothing

            reg.AccRegistrationDoc(pDocCode, pDocDate, pHotelID, pTourOpID, pPayModeID, pAmount, pBAmount, pHAmount, pHPercent, pReference, pNote, pUserName, pDepID, pEmpID, pNights, pAdultPax, pChildPax, pMP, pDocID)
            UpdateInfo(pDocID)
            Me.Response.Redirect("~/Accounting/AccDocDetail.aspx?DocumentID=" & pDocID.ToString)
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Function AccDocDate() As DateTime
        Dim accDate As DateTime = DateTime.Parse(txtDate.Text)
        Try
            If cbInvoiceDate.Checked Then
                If Not String.IsNullOrEmpty(ddlInvoice.SelectedValue) Then
                    Dim RefInvoice As Integer = ddlInvoice.SelectedValue
                    Dim q As New dsInvoiceFormTableAdapters.InvoiceHeadTableAdapter
                    accDate = q.GetDataByID(RefInvoice)(0).InvDate
                End If
            End If
        Catch ex As Exception
        End Try

        Return accDate
    End Function

    Protected Sub UpdateInfo(ByVal DocID As Integer)
        Dim inf As New dsAccRegistrationTableAdapters.QueriesTableAdapter
        Dim RefInvoice As Nullable(Of Integer)
        Dim RefReservation As String = Nothing
        Dim InfoInvoice As String = Nothing
        Dim InfoReservation As String = Nothing
        Dim InfoReceptionDate As Nullable(Of Date)
        Dim InfoApprovalDate As Nullable(Of Date)

        If Not String.IsNullOrEmpty(ddlInvoice.SelectedValue) Then
            RefInvoice = ddlInvoice.SelectedValue
            InfoInvoice = ddlInvoice.SelectedItem.Text
        End If

        Dim refList As New List(Of String)
        Dim infoList As New List(Of String)
        For Each i As ListItem In cblBooking.Items
            If i.Selected Then
                refList.Add(i.Value)
                infoList.Add(i.Text)
            End If
        Next
        If refList.Count > 0 Then RefReservation = Join(refList.ToArray, "; ")
        If infoList.Count > 0 Then InfoReservation = Join(infoList.ToArray, "; ")
        If dateReception.HasValue Then InfoReceptionDate = dateReception.DateValue
        If dateApproval.HasValue Then InfoApprovalDate = dateApproval.DateValue

        inf.UpdateAccDocInfo(DocID, RefInvoice, RefReservation, InfoInvoice, InfoReservation, InfoReceptionDate, InfoApprovalDate)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtBankCharge.Text = String.Empty
        txtHAmount.Text = String.Empty
        txtHPercent.Text = String.Empty
        ddlInvoice.SelectedIndex = 0

        txtAPax.ClearControl()
        txtCPax.ClearControl()
        txtNights.ClearControl()

        pnlInsert.Enabled = True
        pnlAcount.Visible = True
        pnlHotel.Visible = False
        pnlInvoice.Visible = False
        pnlStatistic.Visible = False

        btnUpdate.Visible = True
        btnRegister.Visible = False
        btnCancel.Visible = False
    End Sub

End Class
