
Partial Class Accounting_AccTransfer
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        btnNo.Text = "OK"

        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUser.Value = Membership.GetUser.UserName
        pnlTransPost.Visible = False

        If Not (Page.IsPostBack) Then
            If fvTransfer.FindControl("txtDate") IsNot Nothing Then
                CType(fvTransfer.FindControl("txtDate"), TextBox).Text = LogDateInic.GetDateInit.ToShortDateString 'Today.ToShortDateString
            End If
        End If
    End Sub

    Protected Sub ddlTransfer_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTransfer.DataBound
        btnConfirm.Enabled = Integer.Parse(ddlTransfer.SelectedValue) <> 0
    End Sub

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click
        Dim pTransferID As Integer = Integer.Parse(ddlTransfer.SelectedValue)
        Dim pDocumentID As Integer = Integer.Parse(Request.QueryString("DocumentID"))
        Dim pDate As Date = CType(fvTransfer.FindControl("txtDate"), TextBox).Text
        Dim pAmount As Decimal = Decimal.Parse(CType(fvTransfer.FindControl("txtAmount"), TextBox).Text)
        Dim pHotelID As Integer = CType(fvTransfer.FindControl("ddlHotel"), DropDownList).SelectedValue
        Dim pTourOpID As Integer = CType(fvTransfer.FindControl("ddlTourOp"), DropDownList).SelectedValue
        Dim pNote As String = CType(fvTransfer.FindControl("txtNote"), TextBox).Text
        Dim pTranID As Nullable(Of Integer)


        Dim trans As System.Data.SqlClient.SqlTransaction
        Try
            Dim taTransfer As New AccDocumentTableAdapters.QueriesTableAdapter
            Dim conn = taTransfer.QueryConnection
            conn.Open()
            trans = conn.BeginTransaction()
            taTransfer.SetTransaction(trans)
            taTransfer.AccTransferDoc(pTransferID, pDocumentID, pHotelID, pTourOpID, pAmount, pDate, pNote, hfUser.Value, pTranID)
            UpdateAdditional(taTransfer, pDocumentID, pTranID)
            trans.Commit()

            pnlTransPre.Visible = False
            pnlTransPost.Visible = True

            If pTranID.HasValue Then
                hfTranID.Value = pTranID
                ddlTransfer.Enabled = False
                fvTransfer.Enabled = False
                btnConfirm.Visible = False
                dsAccTransferDoc.Select()
            End If
        Catch ex As Exception
            If trans IsNot Nothing Then trans.Rollback()

            If ex.InnerException IsNot Nothing Then
                popShow("Transfer Error", ex.InnerException.Message)
            Else
                popShow("Transfer Error", ex.Message)
            End If
        End Try

    End Sub

    Protected Sub UpdateAdditional(ByRef ta As AccDocumentTableAdapters.QueriesTableAdapter, ByVal DocID As Integer, ByVal TransID As Integer)
        Dim LiabilityID As Nullable(Of Integer) = CType(fvTransfer.FindControl("ddlLiability"), DropDownList).SelectedValue
        Dim TransferTypeID As Nullable(Of Integer) = CType(fvTransfer.FindControl("ddlTransfer"), DropDownList).SelectedValue
        Dim Invoicenumber As String = CType(fvTransfer.FindControl("AdditionalInvoice"), TextBox).Text
        Dim FirstName As String = CType(fvTransfer.FindControl("AdditionalName"), TextBox).Text
        Dim LastName As String = CType(fvTransfer.FindControl("AdditionalLastName"), TextBox).Text
        Dim BookingName As String = CType(fvTransfer.FindControl("AdditionalBooking"), TextBox).Text
        Dim CheckIn As String = CType(fvTransfer.FindControl("AdditionalCheckIn"), TextBox).Text
        Dim CheckOut As String = CType(fvTransfer.FindControl("AdditionalCheckOut"), TextBox).Text

        ta.UpdateTransferData(Invoicenumber, FirstName, LastName, BookingName, CheckIn, CheckOut, LiabilityID, TransferTypeID, DocID, TransID)
    End Sub

    Protected Sub ddlTransfer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTransfer.SelectedIndexChanged
        If Integer.Parse(ddlTransfer.SelectedValue) <> 0 Then
            btnConfirm.Visible = True
            btnConfirm.Enabled = True
        Else
            btnConfirm.Enabled = False
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Me.Response.Redirect("AccDocDetailNew.aspx?DocumentID=" & Request.QueryString("DocumentID"))
    End Sub

    Protected Sub fvTransfer_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTransfer.ItemCreated
        If fvTransfer.FindControl("txtDate") IsNot Nothing Then
            CType(fvTransfer.FindControl("txtDate"), TextBox).Text = LogDateInic.GetDateInit.ToShortDateString  'Today.ToShortDateString

            Dim DocID As Integer = Integer.Parse(Request.QueryString("DocumentID"))
            Dim ta As New AccDocumentTableAdapters.AccTransDocumentTableAdapter
            Dim doc = ta.GetData(DocID)

            CType(fvTransfer.FindControl("AdditionalInvoice"), TextBox).Text = doc(0).AdditionalInvoicenumber
            CType(fvTransfer.FindControl("AdditionalName"), TextBox).Text = doc(0).AdditionalFirstName
            CType(fvTransfer.FindControl("AdditionalLastName"), TextBox).Text = doc(0).AdditionalLastName
            CType(fvTransfer.FindControl("AdditionalBooking"), TextBox).Text = doc(0).AdditionalBookingName
            CType(fvTransfer.FindControl("AdditionalCheckIn"), TextBox).Text = doc(0).AdditionalCheckIn
            CType(fvTransfer.FindControl("AdditionalCheckOut"), TextBox).Text = doc(0).AdditionalCheckOut

        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccTransfer.rdlc"

        Dim photel As New ReportParameter("hotel", False)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)

        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)



        dsTrMaster.DataBind()
        dsTrDetails.DataBind()
        dsTrBalances.DataBind()

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_AccDocTransferHead", dsTrMaster))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_AccDocTransferDetail", dsTrDetails))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_AccDocTransferBalance", dsTrBalances))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", Master.GetdsDocHeader))


        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Transfer Overview.pdf" + """")
        'End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub
End Class
