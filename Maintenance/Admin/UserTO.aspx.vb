
Partial Class Maintenance_Admin_UserTO
    Inherits System.Web.UI.Page

    Protected Sub lnkSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSelect.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
       
        For Each grv In gvHotels.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub lnkDeselect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDeselect.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvHotels.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = False
        Next
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim ta As New UserTableAdapters.UserInTourOpTableAdapter
        Dim grv As GridViewRow
        For Each grv In gvHotels.Rows
            'UserName
            Dim un As String = Request.QueryString("username")
            'AgencyID
            Dim aid As Integer = Int32.Parse(grv.Cells(1).Text)
            'HasRights
            Dim hrb As Boolean = CType(grv.Cells(0).Controls(1), CheckBox).Checked

            ta.UserInTourOpUpdate(un, aid, hrb)
        Next
    End Sub
End Class
