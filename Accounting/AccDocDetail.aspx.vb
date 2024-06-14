Imports App_UserControls_MessagePop
Imports App_UserControls_InputIntegerControl
Imports App_UserControls_InputDateControl

Partial Class Accounting_AccDocDetail
    Inherits System.Web.UI.Page

#Region "Helpers"
    Public Function CanApprove() As Boolean
        Dim can As Boolean
        can = My.User.IsInRole("accounting_admin") Or My.User.IsInRole("admin")
        Return can
    End Function

    Public Function DepartmentSrc() As String
        Return String.Format("Department.aspx?DocumentID={0}", Request.QueryString("DocumentID"))
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

    Public Function AdditionalInvoice(ByVal InfoInvoice As Object) As String
        Dim ret As String = String.Empty
        If InfoInvoice IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(InfoInvoice) Then ret = String.Format("Invoice:&nbsp;{0}<br />", InfoInvoice)
        End If

        Return ret
    End Function

    Public Function AdditionalReservations(ByVal InfoReservation As Object) As String
        Dim ret As String = String.Empty
        If InfoReservation IsNot DBNull.Value Then
            If Not String.IsNullOrEmpty(InfoReservation) Then
                ret = "Bookings:<br />"
                Dim resList As String() = Split(InfoReservation, "; ")
                For Each r As String In resList
                    ret = ret & "*&nbsp;" & r & "<br />"
                Next
            End If
        End If

        Return ret
    End Function

    Public Function AdditionalDates(ByVal InfoReceptionDate As Object, ByVal InfoApprovalDate As Object) As String
        Dim ret As String = String.Empty
        If Not String.IsNullOrEmpty(InfoReceptionDate) Then ret = ret & "Reception Date:&nbsp;" & InfoReceptionDate & "<br />"
        If Not String.IsNullOrEmpty(InfoApprovalDate) Then ret = ret & "Approval Date:&nbsp;" & InfoApprovalDate & "<br />"
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
                    Me.Response.Redirect("~/Accounting/AccDocDetail.aspx?DocumentID=" & e.CommandArgument)
                Catch ex As Exception
                    msgPop.ShowError(ex)
                End Try
            Case "UpdateDoc"
                If hfEditMode.Value = "Edit" Then
                    DocumentEditUpdate()
                Else
                    DocumentModifyUpdate()
                End If
                pnlFunctions.Visible = True
                cbHotel.Visible = True
                hfEditMode.Value = "Preview"
        End Select
    End Sub

    Protected Sub DocumentEditUpdate()
        Try
            Dim ddlPayMode As DropDownList = fvDocDetail.FindControl("ddlPayMode")
            Dim txtBankCharge As TextBox = fvDocDetail.FindControl("txtBankCharge")
            Dim txtHAmount As TextBox = fvDocDetail.FindControl("txtHAmount")
            Dim txtHPercent As TextBox = fvDocDetail.FindControl("txtHPercent")
            Dim txtReference As TextBox = fvDocDetail.FindControl("txtReference")
            Dim txtNote As TextBox = fvDocDetail.FindControl("txtNote")
            Dim ddlDep As DropDownList = fvDocDetail.FindControl("ddlDep")
            Dim ddlEmp As DropDownList = fvDocDetail.FindControl("ddlEmp")
            Dim txtNights As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtNights")
            Dim txtAPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtAPax")
            Dim txtCPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtCPax")

            Dim q As New dsAccRegistrationTableAdapters.QueriesTableAdapter
            Dim DocumentID As Integer = Request.QueryString("DocumentID")
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
            Dim RoomNights As Nullable(Of Integer) = Nothing : If txtNights.HasValue Then RoomNights = txtNights.IntegerValue
            Dim AdultPax As Nullable(Of Integer) = Nothing : If txtAPax.HasValue Then AdultPax = txtAPax.IntegerValue
            Dim ChildPax As Nullable(Of Integer) = Nothing : If txtCPax.HasValue Then ChildPax = txtCPax.IntegerValue

            q.AccRegistrationDocEdit(DocumentID, DocDate, TourOpID, PayModeID, Amount, BAmount, HAmount, HPercent, _
                                     Reference, Note, UserName, DepID, EmpID, RoomNights, AdultPax, ChildPax, Nothing)
            DocumentInfoUpdate(q, DocumentID)

            fvDocDetail.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub DocumentModifyUpdate()
        Try
            Dim ddlPayMode As DropDownList = fvDocDetail.FindControl("ddlPayMode")
            Dim txtReference As TextBox = fvDocDetail.FindControl("txtReference")
            Dim txtNote As TextBox = fvDocDetail.FindControl("txtNote")
            Dim ddlDep As DropDownList = fvDocDetail.FindControl("ddlDep")
            Dim ddlEmp As DropDownList = fvDocDetail.FindControl("ddlEmp")
            Dim txtNights As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtNights")
            Dim txtAPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtAPax")
            Dim txtCPax As App_UserControls_InputIntegerControl = fvDocDetail.FindControl("txtCPax")

            Dim q As New dsAccRegistrationTableAdapters.QueriesTableAdapter
            Dim DocumentID As Integer = Request.QueryString("DocumentID")

            Dim PayModeID As String = Nothing : If Not String.IsNullOrEmpty(ddlPayMode.SelectedValue) Then PayModeID = ddlPayMode.SelectedValue
            Dim Reference As String = Nothing : If Not String.IsNullOrEmpty(txtReference.Text) Then Reference = txtReference.Text
            Dim Note As String = Nothing : If Not String.IsNullOrEmpty(txtNote.Text) Then Note = txtNote.Text
            Dim DepID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then DepID = ddlDep.SelectedValue
            Dim EmpID As Nullable(Of Integer) = Nothing : If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then EmpID = ddlEmp.SelectedValue
            Dim RoomNights As Nullable(Of Integer) = Nothing : If txtNights.HasValue Then RoomNights = txtNights.IntegerValue
            Dim AdultPax As Nullable(Of Integer) = Nothing : If txtAPax.HasValue Then AdultPax = txtAPax.IntegerValue
            Dim ChildPax As Nullable(Of Integer) = Nothing : If txtCPax.HasValue Then ChildPax = txtCPax.IntegerValue

            q.ModifyDocument(DocumentID, PayModeID, Reference, Note, DepID, EmpID, RoomNights, AdultPax, ChildPax)
            DocumentInfoUpdate(q, DocumentID)

            fvDocDetail.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub DocumentInfoUpdate(ByVal q As dsAccRegistrationTableAdapters.QueriesTableAdapter, ByVal DocumentID As Integer)
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

        q.UpdateAccDocInfo(DocumentID, RefInvoice, RefReservation, InfoInvoice, InfoReservation, InfoReceptionDate, InfoApprovalDate)
    End Sub


    Protected Sub fvDocDetail_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles fvDocDetail.ModeChanging
        pnlFunctions.Visible = (e.NewMode = FormViewMode.ReadOnly)
        cbHotel.Visible = (e.NewMode = FormViewMode.ReadOnly)
    End Sub

    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        Response.Redirect(String.Format("AccDocDetail.aspx?DocumentID={0}", Request.QueryString("DocumentID")))
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
