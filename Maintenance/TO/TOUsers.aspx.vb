
Partial Class Maintenance_TO_TOUsers
    Inherits System.Web.UI.Page

    Protected Sub lnkSelect_Click(sender As Object, e As System.EventArgs) Handles lnkSelect.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell

        For Each grv In gvUserRights.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub lnkDeselect_Click(sender As Object, e As System.EventArgs) Handles lnkDeselect.Click
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvUserRights.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = False
        Next
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click
        Dim ta As New TourOperTableAdapters.UsersForTourOpTableAdapter
        Dim grv As GridViewRow
        Dim toid As Integer = Request.QueryString("TOID")

        For Each grv In gvUserRights.Rows
            Dim usr As String = CType(grv.Cells(0).Controls(3), HiddenField).Value
            Dim rts As Boolean = CType(grv.Cells(0).Controls(1), CheckBox).Checked

            ta.UsersForTourOpUpdate(usr, toid, rts)
            'ta.UserInTourOpUpdate(usr, toid, rts)
        Next
    End Sub
End Class
