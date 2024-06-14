
Partial Class Accounting_AccDocDetailNew
    Inherits System.Web.UI.Page

#Region "Helpers"
    Public Function CanApprove() As Boolean
        Dim can As Boolean
        can = My.User.IsInRole("accounting_admin") Or My.User.IsInRole("admin")
        Return can
    End Function

    Public Function DepartmentSrc() As String
        Return String.Format("DepartmentNew.aspx?DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function ByBookingSrc() As String
        Return String.Format("AccBookApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function ByAnySrc() As String
        Return String.Format("AccAnyApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function GroupSrc() As String
        Return String.Format("AccGroupApplication.aspx?DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function InfoInvoice(ByVal iInvoice As Object) As String
        Dim ret As String = String.Empty
        If iInvoice IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iInvoice) Then ret = String.Format("<i>Invoice:</i>&nbsp;{0}<br />", iInvoice)
        End If

        Return ret
    End Function

    Public Function InfoReservations(ByVal iReservation As Object) As String
        Dim ret As String = String.Empty
        If iReservation IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iReservation) Then
                ret = "<i>Bookings:</i><br />"
                Dim resList As String() = Split(iReservation, "; ")
                For Each r As String In resList
                    ret = ret & "*&nbsp;" & r & "<br />"
                Next
            End If
        End If

        Return ret
    End Function

    Public Function InfoDates(ByVal iReceptionDate As Object, ByVal iApprovalDate As Object) As String
        Dim ret As String = String.Empty
        If Not String.IsNullOrEmpty(iReceptionDate) Then ret = ret & "<i>Reception Date:</i>&nbsp;" & iReceptionDate & "<br />"
        If Not String.IsNullOrEmpty(iApprovalDate) Then ret = ret & "<i>Approval Date:</i>&nbsp;" & iApprovalDate & "<br />"
        Return ret
    End Function

    Public Function Liability(ByVal iLiability As Object) As String
        Dim ret As String = String.Empty
        If iLiability IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iLiability) Then ret = String.Format("<i>Liability Concept:</i>&nbsp;{0}<br />", iLiability)
        End If

        Return ret
    End Function

    Public Function Transfer(ByVal iTransfer As Object) As String
        Dim ret As String = String.Empty
        If iTransfer IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iTransfer) Then ret = String.Format("<i>Transfer Type:</i>&nbsp;{0}<hr/>", iTransfer)
        End If

        Return ret
    End Function

    Public Function AdditionalInvoice(ByVal iInvoice As Object) As String
        Dim ret As String = String.Empty
        If iInvoice IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iInvoice) Then ret = String.Format("<i>Invoice:</i>&nbsp;{0}<br />", iInvoice)
        End If

        Return ret
    End Function

    Public Function AdditionalBooking(ByVal iBooking As Object) As String
        Dim ret As String = String.Empty
        If iBooking IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iBooking) Then ret = String.Format("<i>Booking:</i>&nbsp;{0}<br />", iBooking)
        End If

        Return ret
    End Function

    Public Function AdditionalName(ByVal iFirst As Object, ByVal iLast As Object) As String
        Dim lst As New List(Of String)
        If iLast IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iLast) Then lst.Add(iLast)
        End If

        If iFirst IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iFirst) Then lst.Add(iFirst)
        End If

        Dim ret As String = String.Empty
        If lst.Any() Then
            ret = String.Format("<i>Name:</i>&nbsp{0}<br />", Join(lst.ToArray(), ", "))
        End If

        Return ret
    End Function

    Public Function AdditionalDates(ByVal iCkIn As Object, ByVal iCkOut As Object) As String
        Dim ret As String = String.Empty
        If iCkIn IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iCkIn) Then ret = String.Format("<i>Check In:</i>&nbsp;{0}<br />", iCkIn)
        End If

        If iCkOut IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(iCkOut) Then ret &= String.Format("<i>Check Out:</i>&nbsp;{0}<br />", iCkOut)
        End If

        Return ret
    End Function
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnByBooking.Visible = Master.ArCredit()
        btnByBooking.Enabled = Master.CanApply
        btnApply.Enabled = Master.CanApply
        btnTransfer.Enabled = Master.CanApply
        btnGroup.Visible = Master.ArCredit And Master.CanApply
        hfUser.Value = My.User.Name

        Dim strRefresh As String = String.Format("document.getElementById('{0}').click();", btnRefresh.ClientID)
        popByBookExtender.OnOkScript = strRefresh
        popByBookExtender.OnCancelScript = strRefresh
        popByAnyExtender.OnOkScript = strRefresh
        popByAnyExtender.OnCancelScript = strRefresh
        popGroupExtender.OnOkScript = strRefresh
    End Sub


    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        fvDocDetail.DataBind()
    End Sub

    Protected Sub fvDocDetail_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvDocDetail.ItemCommand
        Select Case e.CommandName
            Case "DocModify"
                fvDocDetail.ChangeMode(FormViewMode.Edit)
                pnlFunctions.Visible = False
                cbHotel.Visible = False
                hfEditMode.Value = "Modify"
            Case "DocEdit"
                fvDocDetail.ChangeMode(FormViewMode.Edit)
                pnlFunctions.Visible = False
                cbHotel.Visible = False
                hfEditMode.Value = "Edit"
            Case "CancelDoc"
                Try
                    Dim ta = New dsAccountingTableAdapters.QueriesTableAdapter
                    ta.CancelQuery(Int32.Parse(e.CommandArgument), My.User.Name)
                    Me.Response.Redirect("~/Accounting/AccDocDetailNew.aspx?DocumentID=" & e.CommandArgument)
                Catch ex As Exception
                    msgPopMain.ShowError(ex)
                End Try
            Case "UpdateDoc"
                If hfEditMode.Value = "Edit" Then
                    If Not DocumentEditUpdate() Then Return
                Else
                    If Not DocumentModifyUpdate() Then Return
                End If
                pnlFunctions.Visible = True
                cbHotel.Visible = True
                hfEditMode.Value = "Preview"
        End Select
    End Sub

    Protected Function DocumentEditUpdate() As Boolean
        Dim trans As System.Data.SqlClient.SqlTransaction
        Try
            Dim DocumentID As Integer = Request.QueryString("DocumentID")
            Dim ddlPayMode As DropDownList = fvDocDetail.FindControl("ddlPayMode")
            Dim txtBankCharge As TextBox = fvDocDetail.FindControl("txtBankCharge")
            Dim txtHAmount As TextBox = fvDocDetail.FindControl("txtHAmount")
            Dim txtHPercent As TextBox = fvDocDetail.FindControl("txtHPercent")
            Dim txtReference As TextBox = fvDocDetail.FindControl("txtReference")
            Dim txtNote As TextBox = fvDocDetail.FindControl("txtNote")
            Dim ddlDep As DropDownList = fvDocDetail.FindControl("ddlDep")
            Dim ddlEmp As DropDownList = fvDocDetail.FindControl("ddlEmp")
            Dim ddlUnit As DropDownList = fvDocDetail.FindControl("ddlUnit")
            Dim txtNights As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtNights")
            Dim txtAPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtAPax")
            Dim txtCPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtCPax")
            Dim DocDate As Date = CType(fvDocDetail.FindControl("txtDate"), TextBox).Text
            Dim TourOpID As Integer = CType(fvDocDetail.FindControl("ddlTourOp"), DropDownList).SelectedValue
            Dim Amount As Decimal = CType(fvDocDetail.FindControl("txtAmount"), TextBox).Text
            Dim UserName As String = My.User.Name

            Dim PayModeID As String = Nothing : If Not String.IsNullOrEmpty(ddlPayMode.SelectedValue) Then PayModeID = ddlPayMode.SelectedValue
            Dim BAmount As Nullable(Of Decimal) = Nothing : If Not String.IsNullOrEmpty(txtBankCharge.Text) Then BAmount = txtBankCharge.Text
            Dim HAmount As Nullable(Of Decimal) = Nothing : If Not String.IsNullOrEmpty(txtHAmount.Text) Then HAmount = txtHAmount.Text
            Dim HPercent As Nullable(Of Decimal) = Nothing : If Not String.IsNullOrEmpty(txtHPercent.Text) Then HPercent = txtHPercent.Text
            Dim Reference As String = Nothing : If Not String.IsNullOrEmpty(txtReference.Text) Then Reference = txtReference.Text
            Dim Note As String = Nothing : If Not String.IsNullOrEmpty(txtNote.Text) Then Note = txtNote.Text
            Dim DepID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then DepID = ddlDep.SelectedValue
            Dim EmpID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then EmpID = ddlEmp.SelectedValue
            Dim UnitID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlUnit.SelectedValue) Then UnitID = ddlUnit.SelectedValue
            Dim RoomNights As Nullable(Of Integer) = Nothing : If txtNights.HasValue Then RoomNights = txtNights.IntegerValue
            Dim AdultPax As Nullable(Of Integer) = Nothing : If txtAPax.HasValue Then AdultPax = txtAPax.IntegerValue
            Dim ChildPax As Nullable(Of Integer) = Nothing : If txtCPax.HasValue Then ChildPax = txtCPax.IntegerValue

            If (UnitID Is Nothing) Then Throw New Exception("Please select Adjustment Type")

            Dim q As New AccDocumentTableAdapters.QueriesTableAdapter
            Dim conn = q.QueryConnection()
            trans = conn.BeginTransaction()
            q.AccRegistrationDocEdit(DocumentID, DocDate, TourOpID, PayModeID, Amount, BAmount, HAmount, HPercent, Reference, Note, UserName, DepID, EmpID, RoomNights, AdultPax, ChildPax, Nothing)
            UpdateInfo(q, DocumentID)
            UpdateBusiness(q, DocumentID)
            UpdateAdditional(q, DocumentID)
            trans.Commit()

            fvDocDetail.ChangeMode(FormViewMode.ReadOnly)

            Return True
        Catch ex As Exception
            If trans IsNot Nothing Then trans.Rollback()
            msgPopMain.ShowError(ex)
            Return False
        End Try
    End Function

    Protected Function DocumentModifyUpdate() As Boolean
        Dim trans As System.Data.SqlClient.SqlTransaction
        Try
            Dim DocumentID As Integer = Request.QueryString("DocumentID")
            Dim ddlPayMode As DropDownList = fvDocDetail.FindControl("ddlPayMode")
            Dim txtReference As TextBox = fvDocDetail.FindControl("txtReference")
            Dim txtNote As TextBox = fvDocDetail.FindControl("txtNote")
            Dim ddlDep As DropDownList = fvDocDetail.FindControl("ddlDep")
            Dim ddlEmp As DropDownList = fvDocDetail.FindControl("ddlEmp")
            Dim ddlUnit As DropDownList = fvDocDetail.FindControl("ddlUnit")
            Dim txtNights As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtNights")
            Dim txtAPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtAPax")
            Dim txtCPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtCPax")

            Dim PayModeID As String = Nothing : If Not String.IsNullOrEmpty(ddlPayMode.SelectedValue) Then PayModeID = ddlPayMode.SelectedValue
            Dim Reference As String = Nothing : If Not String.IsNullOrEmpty(txtReference.Text) Then Reference = txtReference.Text
            Dim Note As String = Nothing : If Not String.IsNullOrEmpty(txtNote.Text) Then Note = txtNote.Text
            Dim DepID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then DepID = ddlDep.SelectedValue
            Dim EmpID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then EmpID = ddlEmp.SelectedValue
            Dim UnitID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlUnit.SelectedValue) Then UnitID = ddlUnit.SelectedValue
            Dim RoomNights As Nullable(Of Integer) = Nothing : If txtNights.HasValue Then RoomNights = txtNights.IntegerValue
            Dim AdultPax As Nullable(Of Integer) = Nothing : If txtAPax.HasValue Then AdultPax = txtAPax.IntegerValue
            Dim ChildPax As Nullable(Of Integer) = Nothing : If txtCPax.HasValue Then ChildPax = txtCPax.IntegerValue

            If (UnitID Is Nothing) Then Throw New Exception("Please select Adjustment Type")

            Dim q As New AccDocumentTableAdapters.QueriesTableAdapter
            Dim conn = q.QueryConnection()
            trans = conn.BeginTransaction()
            q.AccRegistrationDocModify(PayModeID, Reference, Note, DepID, EmpID, RoomNights, AdultPax, ChildPax, DocumentID)
            UpdateInfo(q, DocumentID)
            UpdateBusiness(q, DocumentID)
            UpdateAdditional(q, DocumentID)
            trans.Commit()

            fvDocDetail.ChangeMode(FormViewMode.ReadOnly)

            Return True
        Catch ex As Exception
            If trans IsNot Nothing Then trans.Rollback()
            msgPopMain.ShowError(ex)
            Return False
        End Try
    End Function

    Protected Sub UpdateInfo(ByRef q As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocumentID As Integer)
        Dim RefInvoice As Nullable(Of Integer)
        Dim RefReservation As String = Nothing
        Dim InfoInvoice As String = Nothing
        Dim InfoReservation As String = Nothing
        Dim InfoReceptionDate As Nullable(Of Date) = Nothing
        Dim InfoApprovalDate As Nullable(Of Date) = Nothing

        Dim ddlInvoice As DropDownList = fvDocDetail.FindControl("ddlInvoice")
        Dim cblBooking As CheckBoxList = fvDocDetail.FindControl("cblBooking")
        Dim dateReception As App_UserControls_InputDateControl = fvDocDetail.FindControl("dateReception")
        Dim dateApproval As App_UserControls_InputDateControl = fvDocDetail.FindControl("dateApproval")

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

        q.UpdateInfoData(RefInvoice, RefReservation, InfoInvoice, InfoReservation, InfoReceptionDate, InfoApprovalDate, DocumentID)
    End Sub

    Protected Sub UpdateBusiness(ByRef q As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer)
        Dim ddlUnit As DropDownList = fvDocDetail.FindControl("ddlUnit")
        Dim ddlAdjustment As DropDownList = fvDocDetail.FindControl("ddlAdjustment")
        Dim ddlIncome As DropDownList = fvDocDetail.FindControl("ddlIncome")

        Dim BusinessUnitID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlUnit.SelectedValue) Then BusinessUnitID = ddlUnit.SelectedValue
        Dim AdjustmentTypeID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlAdjustment.SelectedValue) Then AdjustmentTypeID = ddlAdjustment.SelectedValue
        Dim IncomeTypeID As Nullable(Of Integer) : If Not String.IsNullOrEmpty(ddlIncome.SelectedValue) Then IncomeTypeID = ddlIncome.SelectedValue

        q.UpdateBusinessData(BusinessUnitID, AdjustmentTypeID, IncomeTypeID, Nothing, DocID)
    End Sub

    Protected Sub UpdateAdditional(ByRef q As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer)
        Dim AdditionalInvoice As TextBox = fvDocDetail.FindControl("AdditionalInvoice")
        Dim AdditionalName As TextBox = fvDocDetail.FindControl("AdditionalName")
        Dim AdditionalLastName As TextBox = fvDocDetail.FindControl("AdditionalLastName")
        Dim AdditionalBooking As TextBox = fvDocDetail.FindControl("AdditionalBooking")
        Dim AdditionalCheckIn As TextBox = fvDocDetail.FindControl("AdditionalCheckIn")
        Dim AdditionalCheckOut As TextBox = fvDocDetail.FindControl("AdditionalCheckOut")

        Dim Invoicenumber As String = AdditionalInvoice.Text
        Dim FirstName As String = AdditionalName.Text
        Dim LastName As String = AdditionalLastName.Text
        Dim BookingName As String = AdditionalBooking.Text
        Dim CheckIn As String = AdditionalCheckIn.Text
        Dim CheckOut As String = AdditionalCheckOut.Text

        q.UpdateAdditionalData(Invoicenumber, FirstName, LastName, BookingName, CheckIn, CheckOut, DocID)
    End Sub


    Protected Sub fvDocDetail_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles fvDocDetail.ModeChanging
        pnlFunctions.Visible = (e.NewMode = FormViewMode.ReadOnly)
        cbHotel.Visible = (e.NewMode = FormViewMode.ReadOnly)
    End Sub

    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        Response.Redirect(String.Format("AccDocDetailNew.aspx?DocumentID={0}", Request.QueryString("DocumentID")))
    End Sub

    Protected Sub btnTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTransfer.Click
        Me.Response.Redirect("AccTransfer.aspx?DocumentID=" & Request.QueryString("DocumentID"))
    End Sub

#Region "Printing"
    Protected Function AddInfo() As Data.DataTable
        Dim q As New dsAccRegistrationTableAdapters.AccTransDocumentAddInfoTableAdapter
        Dim t As dsAccRegistration.AccTransDocumentAddInfoDataTable = q.GetData(Request.QueryString("DocumentID"))
        For Each r As dsAccRegistration.AccTransDocumentAddInfoRow In t.Rows
            If Not r.IsInfoReservationNull Then r.InfoReservation = "* " & Replace(r.InfoReservation, "; ", vbCrLf & "* ")
            If r.IsInfoInvoiceNull And r.IsInfoReservationNull And r.IsInfoReceptionDateNull And r.IsInfoApprovalDateNull Then r.Delete()
        Next
        t.AcceptChanges()
        Return t
    End Function

    Protected Sub btnPrintT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintT.Click
        'Report Tr
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptTransferDetail.rdlc"

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_RptTransferDetail", dsTransactionsRpt))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccRegistration_AccTransDocumentAddInfo", AddInfo()))
        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Transfer.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnPrintA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintA.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptApplicationDetail.rdlc"

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_SelectAccDocAppl", dsApplications))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_SelectAccDocStatus", dsAppStatus))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccRegistration_AccTransDocumentAddInfo", AddInfo()))
        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Application.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnPrintA_InitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintA_InitButton.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptApplicationDetailInit.rdlc"

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_SelectAccDocAppl", dsApplications))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_SelectAccDocStatus", dsAppStatus))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccRegistration_AccTransDocumentAddInfo", AddInfo()))
        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Application.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub
#End Region

    Protected Sub ddlTourOp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlInvoice As DropDownList = fvDocDetail.FindControl("ddlInvoice")
        ddlInvoice.DataBind()
    End Sub

    Protected Sub ddlInvoice_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim hfRefInvoice As HiddenField = fvDocDetail.FindControl("hfRefInvoice")
        Dim ddlInvoice As DropDownList = sender
        If String.IsNullOrEmpty(hfRefInvoice.Value) Then
            ddlInvoice.SelectedIndex = 0
        Else
            Dim s As ListItem = ddlInvoice.Items.FindByValue(hfRefInvoice.Value)
            If s IsNot Nothing Then
                ddlInvoice.SelectedValue = s.Value
            Else
                ddlInvoice.SelectedIndex = 0
            End If
        End If
    End Sub

    Protected Sub cblBooking_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim hfRefReservation As HiddenField = fvDocDetail.FindControl("hfRefReservation")
        Dim cblBooking As CheckBoxList = sender

        For Each cb As ListItem In cblBooking.Items
            cb.Selected = False
        Next

        If Not String.IsNullOrEmpty(hfRefReservation.Value) Then
            Dim resList As String() = Split(hfRefReservation.Value, "; ")
            For Each r As String In resList
                Dim s As ListItem = cblBooking.Items.FindByValue(r)
                If s IsNot Nothing Then s.Selected = True
            Next
        End If

    End Sub
End Class
