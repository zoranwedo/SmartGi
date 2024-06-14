Imports BavelExport

Partial Class Reports_Invoices_BavelInvoiceXML
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim iid As Integer = Request.QueryString("InvoiceID")
            Dim i As New BavelExport.xmlInvoice(iid, False)
            Dim x As List(Of String) = i.GetInvoiceXML
            Dim r As String
            'i.SaveInvoiceXML(x, "meee", False)

            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "text/xml"
            Response.AppendHeader("Content-Disposition", "attachment; filename=" & i.FileName(0))
            r = i.ExportInfo & vbNewLine & StrDup(i.ExportInfo.Length, "=") & vbNewLine & vbNewLine & x(0)
            Dim br As Integer
            For br = 1 To x.Count - 1
                If br = 1 Then r = r & vbNewLine & vbNewLine & "*** Single Booking exports ***"
                r = r & vbNewLine & vbNewLine & _
                    StrDup(i.FileName(br).Length, "-") & vbNewLine & _
                    i.FileName(br) & vbNewLine & _
                    StrDup(i.FileName(br).Length, "-") & vbNewLine & x(br)
            Next
            Response.Write(r)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "text/xml"
            Response.AppendHeader("Content-Disposition", "attachment; filename=error.txt")
            Response.Write(ex.Message)
            Response.Flush()
            'Response.Close()
            Response.End()
        End Try
    End Sub
End Class
