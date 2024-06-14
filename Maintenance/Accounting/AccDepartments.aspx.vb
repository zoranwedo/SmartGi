
Partial Class Maintenance_Accounting_AccDepartments
    Inherits System.Web.UI.Page

    Protected Sub fltApply_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles fltApply.Click
        Dim filter As New List(Of String)
        Dim dCode As String = "(DepCode like '%{0}%')"
        Dim dText As String = "(DepName like '%{0}%' or Description like '%{0}%')"
        Dim dUnit As String = "(AccBusinessUnitID={0})"
        Dim dActive As String = "(IsActive = 1)"
        Dim dIncome As String = "(AffectsIncome = {0})"

        If Not String.IsNullOrEmpty(fltCode.Text) Then filter.Add(String.Format(dCode, fltCode.Text))
        If Not String.IsNullOrEmpty(fltText.Text) Then filter.Add(String.Format(dText, fltText.Text))
        If Not String.IsNullOrEmpty(fltUnits.SelectedValue) Then filter.Add(String.Format(dUnit, fltUnits.SelectedValue))
        If Not fltInactive.Checked Then filter.Add(dActive)
        If Not String.IsNullOrEmpty(fltIncome.SelectedValue) Then filter.Add(String.Format(dIncome, fltIncome.SelectedValue))

        dsDepart.FilterExpression = Join(filter.ToArray(), " and ")
        gvDep.DataBind()
    End Sub

    Protected Sub fltReset_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles fltReset.Click
        fltCode.Text = Nothing
        fltText.Text = Nothing
        fltUnits.SelectedValue = Nothing
        fltInactive.Checked = True
        fltIncome.SelectedValue = Nothing

        dsDepart.FilterExpression = Nothing
        gvDep.DataBind()
    End Sub

    Protected Sub fltEmpApply_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles fltEmpApply.Click
        Dim filter As New List(Of String)
        Dim dCode As String = "(EmpCode like '%{0}%')"
        Dim dText As String = "(EmpName like '%{0}%' or Description like '%{0}%')"
        Dim dActive As String = "(IsActive = 1)"

        If Not String.IsNullOrEmpty(fltEmpCode.Text) Then filter.Add(String.Format(dCode, fltEmpCode.Text))
        If Not String.IsNullOrEmpty(fltEmpText.Text) Then filter.Add(String.Format(dText, fltEmpText.Text))
        If Not fltEmpInactive.Checked Then filter.Add(dActive)

        dsEmp.FilterExpression = Join(filter.ToArray(), " and ")
        gvEmp.DataBind()
    End Sub

    Protected Sub fltEmpReset_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles fltEmpReset.Click
        fltEmpCode.Text = Nothing
        fltEmpText.Text = Nothing
        fltEmpInactive.Checked = True

        dsEmp.FilterExpression = Nothing
        gvEmp.DataBind()
    End Sub

    Dim IntUnitId As Integer = -1
    Protected Sub dsNewUnits_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
        e.InputParameters("UnitID") = IntUnitId
    End Sub

    Protected Sub gvDep_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvDep.RowEditing
        Dim hfUnitId As HiddenField = gvDep.Rows(e.NewEditIndex).FindControl("hfUnitId")
        IntUnitId = hfUnitId.Value
    End Sub
End Class
