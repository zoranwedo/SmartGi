Imports System.Data.SqlClient
Imports System.Data

Partial Class Maintenance_Reservations_ReservationImport
    Inherits System.Web.UI.Page

    Protected Sub btnImportQueue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnImportQueue.Click
        popImportQueue.Visible = False
        'System.Threading.Thread.Sleep(3000)

        Dim dtsRep As String = ""
        Dim cs As String = ConfigurationManager.ConnectionStrings("csSmart_DTS").ConnectionString
        Dim conn As New SqlConnection(cs)
        Dim cmd As New SqlCommand
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "dtsRun"
        cmd.Connection = conn

        Try
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
        Catch ex As Exception
            dtsRep = ex.Message
        End Try

        Me.lblImportRep.Text = dtsRep
        Me.popImport.Visible = True
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click
        Me.Response.Redirect("~/Maintenance/Reservations/ReservationImport.aspx")
    End Sub
End Class
