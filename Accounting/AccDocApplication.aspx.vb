Imports System.Collections
Partial Class Accounting_AccDocApplication
    Inherits System.Web.UI.Page

    Protected Sub popShowApplication(ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = "Application"
        mdlPopup.Show()
    End Sub

    Protected Sub popShow(ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = "Error"
        mdlPopup.Show()
    End Sub

    Protected Sub dumyRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ta As New dsAccountingTableAdapters.SelectAccDocStatusTableAdapter
        Dim r As dsAccounting.SelectAccDocStatusRow
        hfUser.Value = Membership.GetUser.UserName

        If Not (Page.IsPostBack) Then
            txtTransDate.Text = LogDateInic.GetDateInit.ToShortDateString

            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If
        End If

        Try
            r = ta.GetData(Integer.Parse(Request.QueryString("DocumentID")), hfUser.Value)(0)
            hfCanApply.Value = r.canApply
        Catch ex As Exception
            hfCanApply.Value = False
        End Try

        'If Not (Page.IsPostBack) Then txtTransDate.Text = LogDateInic.GetDateInit.ToShortDateString 'Today.ToShortDateString
    End Sub

    Public Function CanApply() As Boolean
        Return hfCanApply.Value
    End Function

    Protected Sub gvApplications_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvApplications.DataBound
        Dim ta As New dsAccountingTableAdapters.SelectAccDocStatusTableAdapter
        Dim r As dsAccounting.SelectAccDocStatusRow

        Try
            r = ta.GetData(Integer.Parse(Request.QueryString("DocumentID")), hfUser.Value)(0)
            gvApplications.Columns(3).FooterText = r.Balance.ToString("N2")
        Catch ex As Exception
            gvApplications.Columns(3).FooterText = "-"
        End Try
    End Sub

    Protected Sub gvDocToApply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvrs As GridViewRow = gv.SelectedRow
        Dim balDocApp As Decimal = 0
        Dim balDoc As Decimal = 0

        If gvrs Is Nothing Then Exit Sub

        If gv.SelectedDataKey.Item(5) Then
            Dim txtID As TextBox = fvNew.FindControl("txtDocID")   'gv.NamingContainer.FindControl("txtDocID")
            Dim txt As TextBox = fvNew.FindControl("txtDoc")       'gv.NamingContainer.FindControl("txtDoc")
            Dim txtAm As TextBox = fvNew.FindControl("txtAmount")  'gv.NamingContainer.FindControl("txtAmount")
            txtID.Text = gv.SelectedDataKey.Item(0)
            txt.Text = gv.SelectedDataKey.Item(1).ToString + " " + gv.SelectedDataKey.Item(2).ToString


            If gvApplications.Columns(3).FooterText IsNot Nothing Then
                balDocApp = Decimal.Parse(gvApplications.Columns(3).FooterText)
                If gv.SelectedDataKey.Item(4) IsNot Nothing Then
                    balDoc = Decimal.Parse(gv.SelectedDataKey.Item(4))
                    If balDoc < balDocApp Then
                        txtAm.Text = balDoc.ToString("N2")
                    Else
                        txtAm.Text = balDocApp.ToString("N2")
                    End If
                End If
            End If
        End If

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
        Dim usern As String = Membership.GetUser.UserName
        Try
            If (lblTransID.Text <> 0 And lblTransID.Text <> Nothing) Then q.AccApplicationCancel(Int32.Parse(lblTransID.Text), usern)
            lblTransID.Text = Nothing
            txtTransComment.Text = Nothing
            txtTransComment.Enabled = True
            btnCancel.Enabled = False
            btnConfirm.Enabled = False
            txtTransDate.Enabled = True
        Catch ex As Exception
            popShow(ex.Message)
        End Try
    End Sub

    Protected Sub gvApplications_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvApplications.RowCommand
        If e.CommandName = "Delete" Then
            dsAccTranAppl.DeleteParameters.Item("ApplyDocID").DefaultValue = e.CommandArgument
        End If
    End Sub

    Protected Sub gvApplications_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvApplications.RowCreated
        If e.Row.RowIndex = 0 Then
            If e.Row.FindControl("btnDelete") IsNot Nothing Then e.Row.FindControl("btnDelete").Visible = False
        End If
    End Sub

    Protected Sub dsAccTranAppl_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTranAppl.Inserted
        If e.Exception IsNot Nothing Then
            popShow(e.Exception.InnerException.Message)
            'popShow(e.Exception.Message)
            e.ExceptionHandled = True
            'Else
            '    btnCancel.Enabled = True
            '    btnCancel0.Enabled = True
            '    gvApplications.DataBind()
        End If
    End Sub

    Protected Sub dsAccTranAppl_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTranAppl.Deleted
        If e.Exception IsNot Nothing Then
            popShow(e.Exception.InnerException.Message)
        Else
            gvApplications.DataBind()
        End If
    End Sub

    'HANDLE THIS FOR CREATING TRANSACTION
    Protected Sub dsAccTranAppl_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccTranAppl.Inserting
        Dim trid As Nullable(Of Integer)                    'TransactionID
        Dim trdt As Nullable(Of Date)                       'TransactionDate
        Dim amnt As Nullable(Of Decimal)                    'Amount
        Dim apid As Nullable(Of Integer)                    'AppDocID
        Dim usr As String = Membership.GetUser.UserName     'UserName
        Dim cmt As String = Nothing                         'Comment

        If Not String.IsNullOrEmpty(lblTransID.Text) Then trid = Integer.Parse(lblTransID.Text)
        'Date
        Try
            trdt = Date.Parse(txtTransDate.Text)
        Catch ex As Exception
            popShow("Application date empty or not valid.")
            e.Cancel = True
            Exit Sub
        End Try
        'AppDocID
        Try
            Dim t As TextBox = fvNew.FindControl("txtDocID")
            apid = Integer.Parse(t.Text)
        Catch ex As Exception
            popShow("Document for application not selected.")
            e.Cancel = True
            Exit Sub
        End Try
        'Amount
        Try
            Dim t As TextBox = fvNew.FindControl("txtAmount")
            amnt = Math.Abs(Double.Parse(t.Text))
        Catch ex As Exception
            popShow("Amount empty or not valid.")
            e.Cancel = True
            Exit Sub
        End Try
        'Comment
        Try
            Dim t As TextBox = fvNew.FindControl("txtComment")
            If Not String.IsNullOrEmpty(t.Text) Then cmt = t.Text
        Catch ex As Exception
            popShow("Problem with comment?!")
            e.Cancel = True
            Exit Sub
        End Try


        If (trid Is Nothing) Then
            Try
                Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                Dim tcmt As String = txtTransComment.Text
                q.AccApplicationStart(Request.QueryString(0), trdt, tcmt, usr, trid)
                lblTransID.Text = trid.ToString
                txtTransComment.Enabled = False
            Catch ex As Exception
                popShow(ex.Message)
                e.Cancel = True
                Exit Sub
            End Try
        End If

        e.InputParameters("TransID") = trid
        e.InputParameters("ApplyDocID") = apid
        e.InputParameters("ApplyAmount") = amnt
        e.InputParameters("ApplyComment") = cmt
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Accounting\RptApplicationDetailTr.rdlc"
        dsAccTranAppl.DataBind()
        dsDocHeader.DataBind()
        dsAccDocStatus.DataBind()
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_ReportAccTranAppl", dsApplications))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_SelectAccDocStatus", dsAccDocStatus))

        lr.Refresh()
        Dim AppID As Nullable(Of Integer) = 0
        If Not (String.IsNullOrEmpty(lblTransID.Text)) Then AppID = Int32.Parse(lblTransID.Text)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim pAppID As New ReportParameter("appID", AppID)
        Dim pAppDate As New ReportParameter("appDate", Date.Parse(txtTransDate.Text))
        Dim p As ReportParameter() = {puser, pAppID, pAppDate}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DocumentApplication.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click
        Response.Redirect("AccApplications.aspx?DocumentID=" & Request.QueryString(0))
    End Sub

    Protected Sub btnReportBach_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReportBach.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Accounting\RptHistoricalBatch.rdlc"
        dsBatch.DataBind()
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsHistoricalBatch_SelectAccDocBatch", dsBatch))

        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p As ReportParameter() = {puser, photel}
        'Dim p As ReportParameter() = {puser}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Historical_Batch.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub lbApplySel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gvrs As GridViewRow = gvDocToApply.SelectedRow
        Dim balDocApp As Decimal = 0
        Dim balDoc As Decimal = 0
        Dim tc As DataControlFieldCell

        Dim trid As Nullable(Of Integer)                    'TransactionID
        Dim trdt As Nullable(Of Date)                       'TransactionDate
        Dim amnt As Nullable(Of Decimal)                    'Amount
        Dim apid As Nullable(Of Integer)                    'AppDocID
        Dim usr As String = Membership.GetUser.UserName     'UserName
        Dim cmt As String = Nothing                         'Comment
        Dim doc As String = ""
        Dim docapp As String = ""

        Dim txtID As Label
        Dim txtAm As TextBox
        Dim txtCm As TextBox

        'If gvApplications.Columns(5).FooterText IsNot Nothing Then
        If gvApplications.Columns(3).FooterText IsNot Nothing Then
            balDocApp = Decimal.Parse(gvApplications.Columns(3).FooterText)
        End If

        For Each gvrs In gvDocToApply.Rows
            tc = gvrs.Cells(0)

            If (CType(tc.Controls(1), CheckBox).Checked = True) Then

                txtID = gvrs.FindControl("txtDocID")
                txtAm = gvrs.FindControl("txtAmount")
                txtCm = gvrs.FindControl("txtComment")
                doc = CType(gvrs.FindControl("hfDoc"), HiddenField).Value & " "

                'Date
                Try
                    trdt = Date.Parse(txtTransDate.Text)
                Catch ex As Exception
                    popShow("Application date empty or not valid.")
                    Exit Sub
                End Try
                'Comment
                Try
                    If Not String.IsNullOrEmpty(txtCm.Text) Then cmt = txtCm.Text
                Catch ex As Exception
                    popShow("Problem with comment?!")
                    Exit Sub
                End Try

                If Not String.IsNullOrEmpty(lblTransID.Text) Then trid = Integer.Parse(lblTransID.Text)
                If (trid Is Nothing) Then
                    Try
                        Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                        Dim tcmt As String = txtTransComment.Text
                        q.AccApplicationStart(Request.QueryString(0), trdt, tcmt, usr, trid)
                        lblTransID.Text = trid.ToString
                        txtTransComment.Enabled = False
                    Catch ex As Exception
                        popShow(ex.Message)
                        Exit Sub
                    End Try
                End If

                If Not String.IsNullOrEmpty(txtAm.Text) Then
                    amnt = Decimal.Parse(txtAm.Text)
                    If amnt > balDocApp Then amnt = balDocApp
                    balDocApp = balDocApp - amnt
                End If

                If Not String.IsNullOrEmpty(txtID.Text) Then apid = Integer.Parse(txtID.Text)

                Try
                    Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                    q.AccApplicationInsert(trid, apid, amnt, cmt, usr)
                    docapp &= doc & amnt.ToString & " Applied&nbsp;<br />"
                Catch ex As Exception
                    docapp &= doc & amnt.ToString & " NOT Applied:&nbsp;" & ex.Message & "<br />"
                End Try
            End If
        Next
        gvApplications.DataBind()
        gvDocToApply.DataBind()

        btnCancel.Enabled = True
        btnConfirm.Enabled = True
        popShowApplication(docapp)
    End Sub

    Protected Sub lbMulti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbMulti.Click
        lbMulti.BorderColor = Drawing.Color.SkyBlue
        lbSingle.BorderColor = Drawing.Color.White
        pnlFilter.Visible = True
        fvNew.Visible = False
        gvDocToApply.Visible = True
    End Sub

    Protected Sub lbSingle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbSingle.Click
        lbSingle.BorderColor = Drawing.Color.SkyBlue
        lbMulti.BorderColor = Drawing.Color.White
        pnlFilter.Visible = False
        fvNew.Visible = True
        gvDocToApply.Visible = False
    End Sub

    Protected Sub gvDocToApply_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvDocToApply.DataBound
        RePopulateValues()
    End Sub

    Protected Sub gvDocToApply_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDocToApply.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not (e.Row.FindControl("txtAmountFull")is Nothing) Then
                If Not (e.Row.FindControl("txtAmount") Is Nothing) Then CType(e.Row.FindControl("txtAmount"), TextBox).Text = CType(e.Row.FindControl("txtAmountFull"), Label).Text
            End If
        End If

    End Sub

    Protected Sub gvDocToApply_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDocToApply.RowCreated
      
    End Sub

    Protected Sub btFiletrDocs_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFiletrDocs.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim cb As CheckBox
        gvDocToApply.Visible = True
        gvDocToApply.DataBind()

        If (gvDocToApply.Rows.Count > 0) Then

            For Each grv In gvDocToApply.Rows
                tc = grv.Cells(0)
                cb = tc.Controls(1)
                cb.Checked = cb.Enabled
            Next
        End If

    End Sub

    Protected Sub RememberOldValues()
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim categoryIDList As ArrayList = New ArrayList
        Dim index As Integer = -1

        For Each grv In gvDocToApply.Rows
            index = gvDocToApply.DataKeys(grv.RowIndex).Value
            Dim res As Boolean
            tc = grv.Cells(0)
            res = CType(tc.Controls(1), CheckBox).Checked
            ' Check in the Session

            If ViewState("CHECKED_ITEMS") IsNot Nothing Then
                categoryIDList = CType(ViewState("CHECKED_ITEMS"), ArrayList)                
            End If

            If res Then
                If Not (categoryIDList.Contains(index)) Then
                    categoryIDList.Add(index)
                End If
            Else
                categoryIDList.Remove(index)
            End If

            If (categoryIDList IsNot Nothing And categoryIDList.Count > 0) Then
                ViewState("CHECKED_ITEMS") = categoryIDList
            End If
        Next
    End Sub

    Protected Sub RePopulateValues()
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim categoryIDList As ArrayList

        Dim index As Integer
        If CType(ViewState("CHECKED_ITEMS"), ArrayList) IsNot Nothing Then
            categoryIDList = CType(ViewState("CHECKED_ITEMS"), ArrayList)
            If (categoryIDList IsNot Nothing And categoryIDList.Count > 0) Then
                For Each grv In gvDocToApply.Rows
                    index = gvDocToApply.DataKeys(grv.RowIndex).Value
                    If (categoryIDList.Contains(index)) Then
                        tc = grv.Cells(0)
                        CType(tc.Controls(1), CheckBox).Checked = True
                    End If
                Next
            End If
        End If
    End Sub

    Protected Sub gvDocToApply_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvDocToApply.PageIndexChanging
        RememberOldValues()
        gvDocToApply.PageIndex = e.NewPageIndex
        'DataBind()
        'DataBind()
    End Sub

    Protected Sub lbSelectAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles lbSelectAll.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim cb As CheckBox
        For Each grv In gvDocToApply.Rows
            tc = grv.Cells(0)
            cb = tc.Controls(1)
            cb.Checked = cb.Enabled
        Next
    End Sub

    Protected Sub lbDeselectAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles lbDeselectAll.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvDocToApply.Rows
            tc = grv.Cells(0)

            If tc.Enabled Then
                CType(tc.Controls(1), CheckBox).Checked = False
            End If
        Next
    End Sub
End Class

