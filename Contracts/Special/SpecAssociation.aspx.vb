
Partial Class Contracts_Special_SpecAssociation
    Inherits System.Web.UI.Page

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

    Protected Sub gvSpecGroup_DataBound(sender As Object, e As System.EventArgs) Handles gvSpecGroup.DataBound
        pnlSpec4Group.Visible = (gvSpecGroup.Rows.Count = 0)
        pnlExport.Visible = (gvSpecGroup.Rows.Count > 0)
    End Sub

    Protected Sub gvSpecGroup_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpecGroup.RowCommand
        If e.CommandName = "Remove" Then
            Dim q As New dsSpecAssociationTableAdapters.QueriesTableAdapter
            Dim spoID As Integer = e.CommandArgument
            Dim usrID As String = Membership.GetUser.UserName

            '### Loging is in db procedure
            Try
                q.SpecialAssociation_Remove(spoID, usrID)
                gvSpecGroup.DataBind()
                gvSpec4Group.DataBind()
            Catch ex As Exception
                popShow("Special Association", ex)
            End Try
        End If
    End Sub

    Protected Sub gvSpec4Group_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpec4Group.RowCommand
        If e.CommandName = "AssociateGR" Then
            Dim q As New dsSpecAssociationTableAdapters.QueriesTableAdapter
            Dim spoID As Integer = Request.QueryString("SpecialID")
            Dim grpID As Integer = e.CommandArgument
            Dim usrID As String = Membership.GetUser.UserName

            '### Loging is in db procedure
            Try
                q.SpecialAssociation_Add(spoID, grpID, Nothing, usrID)
                gvSpecGroup.DataBind()
                gvSpec4Group.DataBind()
            Catch ex As Exception
                popShow("Special Association", ex)
            End Try
        ElseIf e.CommandName = "AssociateSP" Then
            Dim q As New dsSpecAssociationTableAdapters.QueriesTableAdapter
            Dim spoID As Integer = Request.QueryString("SpecialID")
            Dim spo1ID As Integer = e.CommandArgument
            Dim usrID As String = Membership.GetUser.UserName

            '### Loging is in db procedure
            Try
                q.SpecialAssociation_Add(spoID, Nothing, spo1ID, usrID)
                gvSpecGroup.DataBind()
                gvSpec4Group.DataBind()
            Catch ex As Exception
                popShow("Special Association", ex)
            End Try
        End If
    End Sub

    Protected Sub btEDS_Click(sender As Object, e As System.EventArgs) Handles btEDS.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Contracts\Special\EDSLayoutNew.rdlc"

        dsLayoutRates.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_LayoutRates", dsLayoutRates))

        Dim bytes As Byte()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim reportname As String = "Karisma_" & LayoutFilename()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btGOGO_Click(sender As Object, e As System.EventArgs) Handles btGOGO.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Contracts\Special\GOGOLayout.rdlc"

        dsLayoutRates.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_LayoutRates", dsLayoutRates))

        Dim p As ReportParameter() = {New ReportParameter("pUser", Profile.UserSignature)}
        lr.SetParameters(p)

        Dim bytes As Byte()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim reportname As String = "GOGO_" & LayoutFilename()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function LayoutFilename() As String
        Return "Group#" & gvSpecGroup.SelectedValue
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'This prevents Sys.WebForms.PageRequestManagerParserErrorException
        '   "The message received from the server could not be parsed."
        Dim scriptManager As ScriptManager = scriptManager.GetCurrent(Me.Page)
        scriptManager.RegisterPostBackControl(btEDS)
        scriptManager.RegisterPostBackControl(btGOGO)
    End Sub
End Class
