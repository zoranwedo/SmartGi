
Partial Class Contracts_SpecTest3t
    Inherits System.Web.UI.Page

    Protected Sub fvSpec_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles fvSpec.ItemUpdating
        Dim cb As DropDownList
        cb = fvSpec.FindControl("cbPrType")
        If cb IsNot Nothing Then e.NewValues(13) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrOn")
        If cb IsNot Nothing Then e.NewValues(14) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrDisc")
        If cb IsNot Nothing Then e.NewValues(15) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScType")
        If cb IsNot Nothing Then e.NewValues(17) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScOn")
        If cb IsNot Nothing Then e.NewValues(18) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScDisc")
        If cb IsNot Nothing Then e.NewValues(19) = cb.SelectedValue

        Dim pID As Integer
        Dim pOn As String
        Dim sID As Integer
        Dim sOn As String

        pID = Integer.Parse(e.NewValues(13))
        If String.IsNullOrEmpty(e.NewValues(14)) Then pOn = "-" Else pOn = e.NewValues(14)
        If String.IsNullOrEmpty(e.NewValues(17)) Then sID = 0 Else sID = Integer.Parse(e.NewValues(17))
        If String.IsNullOrEmpty(e.NewValues(18)) Then sOn = "-" Else sOn = e.NewValues(18)

        Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
        e.Cancel = Not chk

        If Not chk Then MsgBox("Discount combinatin not allowed!")
    End Sub

    Protected Sub fvSpec_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvSpec.ItemInserting
        Dim cb As DropDownList
        cb = fvSpec.FindControl("cbPrType")
        If cb IsNot Nothing Then e.Values(13) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrOn")
        If cb IsNot Nothing Then e.Values(14) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrDisc")
        If cb IsNot Nothing Then e.Values(15) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScType")
        If cb IsNot Nothing Then e.Values(17) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScOn")
        If cb IsNot Nothing Then e.Values(18) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScDisc")
        If cb IsNot Nothing Then e.Values(19) = cb.SelectedValue

        Dim pID As Integer
        Dim pOn As String
        Dim sID As Integer
        Dim sOn As String

        pID = Integer.Parse(e.Values(13))
        If String.IsNullOrEmpty(e.Values(14)) Then pOn = "-" Else pOn = e.Values(14)
        If String.IsNullOrEmpty(e.Values(17)) Then sID = 0 Else sID = Integer.Parse(e.Values(17))
        If String.IsNullOrEmpty(e.Values(18)) Then sOn = "-" Else sOn = e.Values(18)

        Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
        e.Cancel = Not chk

        If Not chk Then MsgBox("Discount combinatin not allowed!")
    End Sub
End Class
