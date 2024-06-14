Imports System.Data
Imports System.Data.SqlClient

Partial Class Maintenance_Reservations_ResImport
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

    Protected Sub gvDTSLog_Import(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim import As New dsDTSTableAdapters.dtsImportListTableAdapter
        Dim r As System.Web.UI.WebControls.GridViewRow
        Dim uid As String
        Dim status As Integer
        Dim filename As String
        For Each r In gvDTSLog.Rows
            uid = CType(r.FindControl("hfUID"), HiddenField).Value
            status = CType(r.FindControl("cbStatus"), DropDownList).SelectedValue
            filename = CType(r.FindControl("lblPath"), Label).Text
            If status = 3 Then
                import.Delete(New Guid(uid))
            Else
                import.Update(filename, New Guid(uid), status)
            End If
        Next
        gvDTSLog.DataBind()

        Dim dtsRep As String = ""
        Dim cs As String = ConfigurationManager.ConnectionStrings("csSmart_DTS").ConnectionString
        Dim conn As New SqlConnection(cs)
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "dtsRun"
        cmd.Connection = conn

        Dim dtsResult As New DataSet
        Dim dtsRun As SqlClient.SqlDataAdapter
        dtsRun = New SqlClient.SqlDataAdapter(cmd)
        dtsRun.Fill(dtsResult)
        For Each t As DataTable In dtsResult.Tables
            For Each tr As DataRow In t.Rows
                If Not tr.IsNull(0) Then
                    If Not String.IsNullOrEmpty(tr.Item(0)) Then dtsRep &= tr.Item(0) & "<br />"
                End If
            Next
        Next

        Me.lblImportRep.Text = dtsRep
        Me.modImport.Show()
    End Sub

    Protected Sub dsImportList_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsImportList.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error", "Error")
        End If
    End Sub
End Class
