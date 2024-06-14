Imports System.Data.SqlClient

Partial Class Accounting_DepartmentNew
    Inherits System.Web.UI.Page

    Protected Sub fvDocDetail_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvDocDetail.ItemCommand
        If e.CommandName = "UpdateDoc" Then
            Dim sql As String = "UPDATE AccTransDocument SET DepID={0}, EmpID={1}, AccBusinessUnitID={2} WHERE DocumentID={3}"
            Dim ddlDep As DropDownList = fvDocDetail.FindControl("ddlDep")
            Dim ddlEmp As DropDownList = fvDocDetail.FindControl("ddlEmp")
            Dim ddlUnit As DropDownList = fvDocDetail.FindControl("ddlUnit")
            Dim DocID As String = Request.QueryString("DocumentID")
            Dim DepID As String = IIf(String.IsNullOrEmpty(ddlDep.SelectedValue), "NULL", ddlDep.SelectedValue)
            Dim EmpID As String = IIf(String.IsNullOrEmpty(ddlEmp.SelectedValue), "NULL", ddlEmp.SelectedValue)
            If DepID = "-1" Then
                DepID = "NULL"
                EmpID = "NULL"
            End If
            Dim UnitID As String = IIf(String.IsNullOrEmpty(ddlUnit.SelectedValue), "NULL", ddlUnit.SelectedValue)
            Try
                Dim sConnection As New SqlConnection
                sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
                Dim sCommand As New SqlCommand()
                sCommand.CommandText = String.Format(sql, DepID, EmpID, UnitID, DocID)
                sConnection.Open()
                sCommand.Connection = sConnection
                sCommand.ExecuteNonQuery()
                sConnection.Close()
                Dim src As String = "closeMe();"
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", src, True)
            Catch ex As Exception
                pnlError.Visible = True
                lblError.Text = ex.Message
            End Try
        End If
    End Sub
End Class
