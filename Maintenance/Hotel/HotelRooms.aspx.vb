
Partial Class Maintenance_Hotel_HotelRooms
    Inherits System.Web.UI.Page

    Protected Sub gvRooms_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvRooms.RowCommand
        Dim proc As New dsMaintHotelTableAdapters.QueriesTableAdapter
        Dim hotel As Integer = Int32.Parse(Request.QueryString(0))

        If e.CommandName = "CatUp" Then
            proc.HotelRoomType_UP(hotel, e.CommandArgument.ToString)
            gvRooms.DataBind()
        End If
        If e.CommandName = "CatDwn" Then
            proc.HotelRoomType_DWN(hotel, e.CommandArgument.ToString)
            gvRooms.DataBind()
        End If
    End Sub

    Protected Sub newHotelRoom_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles newHotelRoom.ItemCommand
        If (e.CommandName.Contains("Cancel")) Then
            newHotelRoom.EnableViewState = False
            gvRooms.DataBind()
        End If
    End Sub

    Protected Sub dsHotelRoomType_Changed(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelRoomType.Deleted, dsHotelRoomType.Updated
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    If inner.Message.Contains("FK_ContractRoom_HotelRoomType") Then
                        msgError &= "This Room is used by Contract and can't be deleted!"
                    End If
                End If
            Else
                msgError = e.Exception.Message
            End If

            popShow(False, "Deleting Room Type", msgError)

            e.ExceptionHandled = True
        End If



        'If e.Exception IsNot Nothing Then
        '    Dim msgError As String = ""
        '    If e.Exception.InnerException IsNot Nothing Then
        '        msgError = e.Exception.InnerException.Message
        '    Else
        '        msgError = e.Exception.Message
        '    End If
        '    popShow(False, "Hotel Room Type", msgError)
        '    e.ExceptionHandled = True
        'End If
    End Sub

    Protected Sub dsRoomOccupancy_Changed(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomOccupancy.Inserted, dsRoomOccupancy.Deleted, dsRoomOccupancy.Updated
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Occupancy", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsRoomMapping_Changed(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomMapping.Deleted, dsRoomMapping.Inserted, dsRoomMapping.Updated
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Room Mappings", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub newHotelRoom_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles newHotelRoom.ItemInserted
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    msgError &= "Check if RoomType is duplicate!"
                    'msgError &= "<br />" & inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    msgError &= "There are one or more required fields that are missing!"
                    'msgError &= "<br />" & inner.Message
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    msgError &= String.Concat("The ", paramName, " value is illegal.")
                    'msgError &= "<br />" & inner.Message
                ElseIf TypeOf inner Is ApplicationException Then
                    msgError &= inner.Message
                End If
            Else
                msgError = e.Exception.Message
            End If

            popShow(False, "Inserting Room Type", msgError)

            e.ExceptionHandled = True
            e.KeepInInsertMode = True
            newHotelRoom.EnableViewState = True
        Else
            newHotelRoom.EnableViewState = False
        End If
    End Sub

    Protected Sub gvRooms_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRooms.DataBound
        pnlRoom.Visible = (gvRooms.SelectedValue IsNot Nothing)
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

    Protected Sub gvOccupancy_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvOccupancy.DataBinding
        Dim p As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim r As dsMaintHotel.HotelOcuppancyRow = p.GetData(Int32.Parse(Request.QueryString(0))).Rows(0)

        If r IsNot Nothing Then
            gvOccupancy.Columns(4).Visible = r.ChldCategories > 0
            If Not r.IsChld1ShLabelNull Then gvOccupancy.Columns(4).HeaderText = r.Chld1ShLabel
            If Not r.IsChld1AgShLabelNull Then gvOccupancy.Columns(4).FooterText = r.Chld1AgShLabel
            gvOccupancy.Columns(5).Visible = r.ChldCategories > 1
            If Not r.IsChld2ShLabelNull Then gvOccupancy.Columns(5).HeaderText = r.Chld2ShLabel
            If Not r.IsChld2AgShLabelNull Then gvOccupancy.Columns(5).FooterText = r.Chld2AgShLabel
            gvOccupancy.Columns(6).Visible = r.ChldCategories > 2
            If Not r.IsChld3ShLabelNull Then gvOccupancy.Columns(6).HeaderText = r.Chld3ShLabel
            If Not r.IsChld3AgShLabelNull Then gvOccupancy.Columns(6).FooterText = r.Chld3AgShLabel
            gvOccupancy.Columns(7).Visible = r.ChldCategories > 3
            If Not r.IsChld4ShLabelNull Then gvOccupancy.Columns(7).HeaderText = r.Chld4ShLabel
            If Not r.IsChld4AgShLabelNull Then gvOccupancy.Columns(7).FooterText = r.Chld4AgShLabel

            '    If fvOccupancy.CurrentMode <> FormViewMode.Insert Then
            '        Dim l As Label
            '        l = fvOccupancy.FindControl("spcLabel1")
            '        If l IsNot Nothing Then l.Width = r.ChldCategories * 50 + 55
            '        'l = fvOccupancy.FindControl("spcLabel2")
            '        'If l IsNot Nothing Then l.Visible = r.ChldCategories > 0
            '        'l = fvOccupancy.FindControl("spcLabel3")
            '        'If l IsNot Nothing Then l.Visible = r.ChldCategories > 1
            '        'l = fvOccupancy.FindControl("spcLabel4")
            '        'If l IsNot Nothing Then l.Visible = r.ChldCategories > 2
            '        'l = fvOccupancy.FindControl("spcLabel5")
            '        'If l IsNot Nothing Then l.Visible = r.ChldCategories > 3
            '    End If
        End If
    End Sub

    Protected Sub dsHotelRoomType_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsHotelRoomType.Inserting
        Dim p As New dsMaintBasicTableAdapters.RoomTypeTableAdapter
        Dim r As dsMaintBasic.RoomTypeRow

        'If Not String.IsNullOrEmpty(CType(newHotelRoom.FindControl("ddlRoomType"), DropDownList).SelectedValue) Then
        'r = p.GetDataBy(CType(newHotelRoom.FindControl("ddlRoomType"), DropDownList).SelectedValue).Rows(0)
        If Not String.IsNullOrEmpty(CType(newHotelRoom.FindControl("ddlRoomType"), TextBox).Text) Then
            r = p.GetDataBy(CType(newHotelRoom.FindControl("ddlRoomType"), TextBox).Text).Rows(0)
            e.InputParameters("RoomType") = r.RoomType
        End If

        'Dim txt As TextBox = CType(gvRooms.FindControl("ddlRoomType"), TextBox)
        'txt.Text = r.RoomType
    End Sub

    Protected Sub fvOccupancy_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvOccupancy.DataBound
        Dim p As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim r As dsMaintHotel.HotelOcuppancyRow = p.GetData(Int32.Parse(Request.QueryString(0))).Rows(0)

        If r IsNot Nothing Then
            If fvOccupancy.CurrentMode <> FormViewMode.Insert Then
                Dim l As Label
                l = fvOccupancy.FindControl("spcLabel1")
                If l IsNot Nothing Then l.Width = r.ChldCategories * 50 + 55
            Else
                Dim l As TextBox
                l = fvOccupancy.FindControl("Chld1TextBox")
                If l IsNot Nothing Then l.Visible = r.ChldCategories > 0
                l = fvOccupancy.FindControl("Chld2TextBox")
                If l IsNot Nothing Then l.Visible = r.ChldCategories > 1
                l = fvOccupancy.FindControl("Chld3TextBox")
                If l IsNot Nothing Then l.Visible = r.ChldCategories > 2
                l = fvOccupancy.FindControl("Chld4TextBox")
                If l IsNot Nothing Then l.Visible = r.ChldCategories > 3
            End If
        End If
    End Sub

    Protected Sub gvPopRoom_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        'Dim pop As AjaxControlToolkit.PopupControlExtender = newHotelRoom.FindControl("PopupControlExtender1")
        'If pop IsNot Nothing Then
        '    pop.Commit(gv.SelectedValue)
        'End If


        Dim txt As TextBox = newHotelRoom.FindControl("ddlRoomType")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)



        'hfUserName
    End Sub

    '<System.Web.Services.WebMethodAttribute()> <System.Web.Script.Services.ScriptMethodAttribute()> _
    'Public Shared Function GetDynamicContent(ByVal contextKey As System.String) As System.String

    'End Function

    Protected Sub dsRoomMapping_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsRoomMapping.Inserting

    End Sub

    Protected Sub fvMapping_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvMapping.ItemInserting

    End Sub

    Protected Sub dsRoomMapping_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsRoomMapping.Updating

    End Sub

    Protected Sub gvMapping_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvMapping.RowUpdated

    End Sub

    Protected Sub gvMapping_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvMapping.RowUpdating

    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub gvRooms_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvRooms.RowDeleted
        
    End Sub
End Class
