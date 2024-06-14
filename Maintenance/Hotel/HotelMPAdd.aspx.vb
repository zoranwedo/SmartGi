
Partial Class Maintenance_Hotel_HotelMPAdd
    Inherits System.Web.UI.Page

    Protected Sub dsHotelMPAdd_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting MPAddOn", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsHotelMPAdd_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error iserting MPAddOn", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Me.gridAddOn.DataBind()
        End If
    End Sub

    Protected Sub dsHotelMP_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsHotelMPAdd.Selecting

    End Sub

    Protected Sub gridMP_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridMP.SelectedIndexChanged
     
    End Sub

    Protected Sub dsHotelMPAdd_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing MPAddOn", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
            'Else
            '    Me.gridAddOn.DataBind()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        For Each row As GridViewRow In gridAddOn.Rows
            gridAddOn.UpdateRow(row.RowIndex, False)
        Next
    End Sub
End Class
