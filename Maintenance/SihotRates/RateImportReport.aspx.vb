
Partial Class Maintenance_SihotRates_RateImportReport
    Inherits System.Web.UI.Page

    Protected Sub gvImport_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvImport.DataBound
        If gvImport.Rows.Count > 0 Then
            For Each r As GridViewRow In gvImport.Rows
                Dim id As Integer = CType(r.FindControl("hfID"), HiddenField).Value()
                Select Case ID
                    Case 0
                        r.Cells(1).CssClass = "SelectRow1B"
                        r.Cells(1).Font.Bold = True
                    Case 1
                        r.BorderStyle = BorderStyle.None
                        r.Cells(1).Font.Bold = True
                    Case 2
                        r.BorderStyle = BorderStyle.None
                        r.Cells(1).Style.Item("padding-left") = "25px"
                    Case 3
                        r.Cells(1).CssClass = "GridRow1TB"
                        r.Cells(1).Font.Bold = True
                    Case 4
                        r.BorderStyle = BorderStyle.None
                        r.Cells(1).Font.Bold = True
                    Case Is > 4
                        r.BorderStyle = BorderStyle.None
                        r.Cells(1).Style.Item("padding-left") = "25px"
                End Select
            Next
        End If
    End Sub

End Class
