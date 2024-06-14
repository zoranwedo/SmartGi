
Partial Class Maintenance_Hotel_HotelSections
    Inherits System.Web.UI.Page

    'Public Sub SetSection(ByVal SecIn As Boolean)
    '    Dim sec As New HotelsTableAdapters.HotelRoomTypeTableAdapter
    '    Dim SecID As Nullable(Of Integer) = Nothing
    '    Dim rtid As String

    '    'If no sectiion id and must set it
    '    If SecIn Then
    '        SecID = Int32.Parse(gvHotelSections.SelectedValue)
    '        rtid = gvRoomsOut.SelectedValue
    '    Else
    '        rtid = gvRoomsIn.SelectedValue
    '    End If

    '    sec.UpdateSection(SecID, Int32.Parse(Request.QueryString(0)), rtid)

    '    dsInSectionRoomType.DataBind()
    '    dsNotInSectionRoomType.DataBind()
    '    gvRoomsOut.DataBind()
    '    gvRoomsIn.DataBind()
    'End Sub

    Protected Sub btnRight_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRight.Click
        'SetSection(False)
        If (gvRoomsIn.SelectedRow IsNot Nothing) Then
            Dim proc As New dsMaintHotelTableAdapters.HotelRoomSectionTableAdapter
            Dim htl As Integer = Int32.Parse(Request.QueryString(0))
            Dim sect As Integer = Int32.Parse(gvHotelSections.SelectedValue)
            Dim room As String = gvRoomsIn.SelectedValue

            proc.Update(Nothing, htl, room)

            dsInSectionRoomType.DataBind()
            dsNotInSectionRoomType.DataBind()
            gvRoomsOut.DataBind()
            gvRoomsIn.DataBind()
        End If
    End Sub

    Protected Sub btnLeft_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLeft.Click
        'SetSection(True)
        If (gvRoomsOut.SelectedRow IsNot Nothing) Then
            Dim proc As New dsMaintHotelTableAdapters.HotelRoomSectionTableAdapter
            Dim htl As Integer = Int32.Parse(Request.QueryString(0))
            Dim sect As Integer = Int32.Parse(gvHotelSections.SelectedValue)
            Dim room As String = gvRoomsOut.SelectedValue

            proc.Update(sect, htl, room)

            dsInSectionRoomType.DataBind()
            dsNotInSectionRoomType.DataBind()
            gvRoomsOut.DataBind()
            gvRoomsIn.DataBind()
        End If
    End Sub

    Protected Sub btnRightAll_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRightAll.Click
        For Each grv As GridViewRow In gvRoomsIn.Rows
            gvRoomsIn.SelectedIndex = grv.RowIndex
            btnRight_Click(sender, e)
        Next

    End Sub

    Protected Sub btnLeftAll_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLeftAll.Click
        For Each grv As GridViewRow In gvRoomsOut.Rows
            gvRoomsOut.SelectedIndex = grv.RowIndex
            btnLeft_Click(sender, e)
        Next
    End Sub

    Protected Sub gvHotelSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvHotelSections.DataBound
        If (gvHotelSections.Rows.Count < 1) Then
            pnlRooms.Visible = False
        Else
            pnlRooms.Visible = True
        End If
    End Sub

    Protected Sub gvHotelSections_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvHotelSections.RowCommand
        Dim proc As New dsMaintHotelTableAdapters.QueriesTableAdapter

        If e.CommandName = "CatUp" Then
            proc.HotelSection_UP(e.CommandArgument.ToString)
            gvHotelSections.DataBind()
        End If
        If e.CommandName = "CatDwn" Then
            proc.HotelSection_DWN(e.CommandArgument.ToString)
            gvHotelSections.DataBind()
        End If
    End Sub

    Protected Sub dsHotelsSection_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelsSection.Deleted

        If e.Exception IsNot Nothing Then
            popShow(False, "Error on Hotel Section", "There are rooms linked in this section. //n First, you must remove them from section and then delete section itself!")
            e.ExceptionHandled = True
        Else
            gvHotelSections.DataBind()
        End If
    End Sub

    Protected Sub dsHotelsSection_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelsSection.Updated, dsHotelsSection.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error on Hotel Section", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub gvRoomsOut_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRoomsOut.DataBound
        If (gvRoomsOut.Rows.Count < 1) Then
            btnLeft.Visible = False
            'btnLeftAll.Visible = False
        Else
            btnLeft.Visible = True
            'btnLeftAll.Visible = True
        End If
    End Sub

    Protected Sub gvRoomsIn_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRoomsIn.DataBound
        If (gvRoomsIn.Rows.Count < 1) Then
            btnRight.Visible = False
            'btnRightAll.Visible = False
        Else
            btnRight.Visible = True
            'btnRightAll.Visible = True
        End If
    End Sub
 
    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

End Class
