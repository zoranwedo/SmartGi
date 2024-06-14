
Partial Class Accounting_AccRegisterDoc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetNoStore()
        Response.Cache.AppendCacheExtension("no-cache")
        Response.Expires = 0
        If Not (Page.IsPostBack) Then
            txtDate.Text = LogDateInic.GetDateInit.ToShortDateString 'Today.ToShortDateString
            SetPanelState(pnlInsert, True)
        End If
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

#Region "Update Steps"
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If hfStep.Value = 0 Then
            Step1()
        ElseIf hfStep.Value = 1 Then
            Step2()
        ElseIf hfStep.Value = 2 Then
            Step3()
        End If
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        If hfStep.Value = 1 Then
            SetPanelState(pnlInsert, True)

            pnlHotel.Visible = False
            pnlDepartment.Visible = False
            btnBack.Visible = False

            hfStep.Value = 0
        ElseIf hfStep.Value = 2 Then
            SetPanelState(pnlDepartment, True)
            SetPanelState(pnlHotel, True)

            pnlAcount.Visible = False
            pnlInvoice.Visible = False
            pnlStatistic.Visible = False

            hfStep.Value = 1
        ElseIf hfStep.Value = 3 Then
            SetPanelState(pnlAcount, True)
            SetPanelState(pnlInvoice, True)
            SetPanelState(pnlStatistic, True)

            pnlAdditional.Visible = False
            pnlInfo.Visible = False

            btnBack.Visible = True
            btnUpdate.Visible = True
            btnRegister.Visible = False
            btnCancel.Visible = False

            hfStep.Value = 2
        End If
    End Sub

    Protected Sub SetPanelState(ByVal p As Panel, ByVal state As Boolean)
        Dim stateColor As System.Drawing.Color
        stateColor = IIf(state, Drawing.Color.White, Drawing.Color.LightGray)

        p.Enabled = state
        For Each c As Control In p.Controls
            If TypeOf c Is TextBox Then
                CType(c, TextBox).BackColor = stateColor
            ElseIf TypeOf c Is DropDownList Then
                CType(c, DropDownList).BackColor = stateColor
            Else
                For Each cc As Control In c.Controls
                    If TypeOf cc Is TextBox Then
                        CType(cc, TextBox).BackColor = stateColor
                    ElseIf TypeOf cc Is DropDownList Then
                        CType(cc, DropDownList).BackColor = stateColor
                    End If
                Next
            End If
        Next
        If p.ID = "pnlInvoice" Then
            ddlInvoice.BackColor = stateColor
            cblBooking.BackColor = stateColor
            cbInvoiceDate.BackColor = stateColor
        End If
    End Sub

    Protected Sub Step1()
        Dim trCode As String = ddlDocType.SelectedValue
        Dim hotelID As Integer = ctrlHotel.SelectedHotel
        Dim userName As String = My.User.Name
        Dim statistic As Boolean = False

        If Not String.IsNullOrEmpty(txtDate.Text) Then
            Dim chkdt As Date = Date.Parse(txtDate.Text)

            Dim statusQ As New AccUnitsTableAdapters.SelectAccRegOptionsTableAdapter
            Dim statusRow As AccUnits.SelectAccRegOptionsRow = statusQ.GetData(trCode, hotelID, chkdt, userName).Rows(0)
            Dim hotelChanged As Boolean = hotelID <> hfHotelID.Value
            Dim percentNotSet As String = String.IsNullOrEmpty(txtHPercent.Text)
            hfHotelID.Value = hotelID

            If (Not statusRow.IsPrecentNull And (hotelChanged Or percentNotSet)) Then txtHPercent.Text = statusRow.Precent
            If (String.IsNullOrEmpty(txtHPercent.Text)) Then txtHPercent.Text = "100"
            txtHAmount.Text = Decimal.Parse(txtAmount.Text) * Decimal.Parse(txtHPercent.Text) / 100

            SetPanelState(pnlInsert, False)

            pnlHotel.Visible = statusRow.editHAmount
            pnlDepartment.Visible = True
            btnBack.Visible = True

            hfStep.Value = 1
        Else
            msgPop.ShowPrompt("You must input all parameters!")
        End If
    End Sub

    Protected Sub Step2()
        Dim trCode As String = ddlDocType.SelectedValue
        Dim hotelID As Integer = ctrlHotel.SelectedHotel
        Dim ttooID As Integer = ctrlTourOp.SelectedTourOp
        Dim userName As String = My.User.Name
        Dim chkdt As Date = Date.Parse(txtDate.Text)

        Dim statusQ As New AccUnitsTableAdapters.SelectAccRegOptionsTableAdapter
        Dim statusRow As AccUnits.SelectAccRegOptionsRow = statusQ.GetData(trCode, hotelID, chkdt, userName).Rows(0)

        If (Not statusRow.IsPrecentNull And String.IsNullOrEmpty(txtHPercent.Text)) Then txtHPercent.Text = statusRow.Precent
        txtHAmount.Text = Decimal.Parse(txtAmount.Text) * Decimal.Parse(txtHPercent.Text) / 100
        If Not statusRow.isACNT Then txtBankCharge.Text = String.Empty

        SetPanelState(pnlDepartment, False)
        SetPanelState(pnlHotel, False)

        pnlAcount.Visible = statusRow.isACNT
        pnlInvoice.Visible = True
        pnlStatistic.Visible = statusRow.isStat

        hfStep.Value = 2
    End Sub

    Protected Sub Step3()
        Dim trCode As String = ddlDocType.SelectedValue
        Dim hotelID As Integer = ctrlHotel.SelectedHotel
        Dim ttooID As Integer = ctrlTourOp.SelectedTourOp
        Dim userName As String = My.User.Name
        Dim chkdt As Date = Date.Parse(txtDate.Text)

        Dim statusQ As New AccUnitsTableAdapters.SelectAccRegOptionsTableAdapter
        Dim statusRow As AccUnits.SelectAccRegOptionsRow = statusQ.GetData(trCode, hotelID, chkdt, userName).Rows(0)

        SetPanelState(pnlAcount, False)
        SetPanelState(pnlInvoice, False)
        SetPanelState(pnlStatistic, False)

        pnlAdditional.Visible = statusRow.docType = "Inv." Or statusRow.docType = "Rec."
        pnlInfo.Visible = True

        btnUpdate.Visible = False
        btnRegister.Visible = True

        hfStep.Value = 3
    End Sub
#End Region

#Region "Insert"
    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Dim trans As System.Data.SqlClient.SqlTransaction
        Try
            Dim pDocCode As String = ddlDocType.SelectedValue
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

            If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then
                pDepID = Decimal.Parse(ddlDep.SelectedValue)
                If pDepID = -1 Then
                    pDepID = Nothing
                Else
                    If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then pEmpID = Decimal.Parse(ddlEmp.SelectedValue)
                End If
            End If

            Dim reg As New AccDocumentTableAdapters.QueriesTableAdapter
            Dim conn = reg.QueryConnection
            conn.Open()
            trans = conn.BeginTransaction()
            reg.SetTransaction(trans)
            reg.AccRegistrationDoc(pDocCode, pDocDate, pHotelID, pTourOpID, pPayModeID, pAmount, pBAmount, pHAmount, pHPercent, pReference, pNote, pUserName, pDepID, pEmpID, pNights, pAdultPax, pChildPax, pMP, pDocID)
            UpdateInfo(reg, pDocID)
            UpdateBusiness(reg, pDocID)
            If pnlAdditional.Visible Then UpdateAdditional(reg, pDocID)
            trans.Commit()
            Me.Response.Redirect("~/Accounting/AccDocDetailNew.aspx?DocumentID=" & pDocID.ToString)
        Catch ex As Exception
            If trans IsNot Nothing Then trans.Rollback()
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub UpdateInfo(ByRef inf As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer)
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

        inf.UpdateInfoData(RefInvoice, RefReservation, InfoInvoice, InfoReservation, InfoReceptionDate, InfoApprovalDate, DocID)
    End Sub

    Protected Sub UpdateBusiness(ByRef inf As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer)
        Dim BusinessUnitID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlUnit.SelectedValue) Then BusinessUnitID = ddlUnit.SelectedValue
        Dim AdjustmentTypeID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlAdjustment.SelectedValue) Then AdjustmentTypeID = ddlAdjustment.SelectedValue
        Dim IncomeTypeID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlIncome.SelectedValue) Then IncomeTypeID = ddlIncome.SelectedValue
        Dim HotelBankID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlAccount.SelectedValue) Then HotelBankID = ddlAccount.SelectedValue

        inf.UpdateBusinessData(BusinessUnitID, AdjustmentTypeID, IncomeTypeID, HotelBankID, DocID)
    End Sub

    Protected Sub UpdateAdditional(ByRef inf As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer)
        Dim Invoicenumber As String = AdditionalInvoice.Text
        Dim FirstName As String = AdditionalName.Text
        Dim LastName As String = AdditionalLastName.Text
        Dim BookingName As String = AdditionalBooking.Text
        Dim CheckIn As String = AdditionalCheckIn.Text
        Dim CheckOut As String = AdditionalCheckOut.Text

        inf.UpdateAdditionalData(Invoicenumber, FirstName, LastName, BookingName, CheckIn, CheckOut, DocID)
    End Sub
#End Region
End Class
