Imports System.Data
Imports System.Data.SqlClient

Partial Class Maintenance_RateTransfer_RTransfExport
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub dsForExport_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsForExport.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error", "Error inserting hotel for export!")
        End If
    End Sub

    Protected Sub fvTransf_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvTransf.ItemInserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error", "Error inserting hotel for export!")
        End If
    End Sub

    Protected Sub gvTransf_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvTransf.RowDeleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error", "Error deleting hotel for export!")
        End If
    End Sub

    Protected Sub dsForExport_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsForExport.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error", "Error deleting hotel for export!")
        End If
    End Sub

    Protected Sub gvDTSLog_Export(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRun.Click
        Dim dtsRep As String = ""
        Dim cs As String = ConfigurationManager.ConnectionStrings("csSmart_DTS").ConnectionString
        Dim conn As New SqlConnection(cs)
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "smart_Run"
        cmd.Connection = conn
        cmd.CommandTimeout = 0

        Dim dtsResult As New DataSet
        Dim dtsRun As New SqlClient.SqlDataAdapter(cmd)
        Try
            Me.lblImportRep.Text = ""
            dtsRun.Fill(dtsResult)
            For Each t As DataTable In dtsResult.Tables
                For Each tr As DataRow In t.Rows
                    If Not tr.IsNull(0) Then
                        If Not String.IsNullOrEmpty(tr.Item(0)) Then dtsRep &= tr.Item(0) & "<br />"
                    End If
                Next
            Next

            Me.lblImportRep.Text = dtsRep
            Me.modExport.Show()
        Catch ex As Exception
            If ex.InnerException IsNot Nothing Then
                popShow(False, "Rate Transfer Error", ex.InnerException.Message)
            Else
                popShow(False, "Rate Transfer Error", ex.Message)
            End If
        End Try
    End Sub

    Protected Sub btnRun0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRun0.Click
        Dim dtsRep As String = ""
        Dim cs As String = ConfigurationManager.ConnectionStrings("csSmart_DTS").ConnectionString
        Dim conn As New SqlConnection(cs)
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "smart_Response"
        cmd.Connection = conn
        cmd.CommandTimeout = 0

        Dim dtsResult As New DataSet
        Dim dtsRun As New SqlClient.SqlDataAdapter(cmd)
        Try
            Me.lblImportRep.Text = ""
            dtsRun.Fill(dtsResult)
            For Each t As DataTable In dtsResult.Tables
                For Each tr As DataRow In t.Rows
                    If Not tr.IsNull(0) Then
                        If Not String.IsNullOrEmpty(tr.Item(0)) Then dtsRep &= tr.Item(0) & "<br />"
                    End If
                Next
            Next

            Me.lblImportRep.Text = dtsRep
            Me.modExport.Show()
        Catch ex As Exception
            If ex.InnerException IsNot Nothing Then
                popShow(False, "Response Processing Error", ex.InnerException.Message)
            Else
                popShow(False, "Response Processing Error", ex.Message)
            End If
        End Try
    End Sub
End Class
