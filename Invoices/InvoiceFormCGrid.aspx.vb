Imports System.Data.SqlClient

Partial Class Invoices_InvoiceFormCGrid
    Inherits System.Web.UI.Page

    Protected Function ExceptionText(ByRef ex As Exception) As String
        Dim result As String
        If ex.InnerException IsNot Nothing Then
            result = ex.InnerException.Message
        Else
            result = ex.Message
        End If

        Return result
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles Me.Load
        If Me.IsPostBack = False Then
            Dim a As New dsConceptTableAdapters.ConceptTableAdapter()
            Dim t As dsConcept.ConceptDataTable = a.GetActive()

            gvConcepts.DataSource = t
            gvConcepts.DataBind()
        End If
    End Sub

    Protected Sub gvConcepts_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvConcepts.RowCommand
        If e.CommandName = "AddConcept" Then
            Dim invoiceID As Integer = Request.QueryString("InvoiceID")
            Dim detailID As Integer = Request.QueryString("DetailID")
            Dim conceptID As Integer = e.CommandArgument
            Dim amount As Decimal = CType(gvConcepts.Rows(gvConcepts.EditIndex).FindControl("txtAmount"), TextBox).Text

            Dim q As New dsConceptTableAdapters.InvStayConceptTableAdapter
            Try
                q.Insert(invoiceID, detailID, conceptID, amount)
                gvConcepts.EditIndex = -1
                ClientScript.RegisterStartupScript(Me.GetType(), "onload", "okay();", True)
            Catch ex As Exception
                lblError.Text = ExceptionText(ex)
                lblError.Visible = True
            End Try

        End If
    End Sub
End Class
