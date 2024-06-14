
Partial Class Invoices_ProFormaResCreate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsFilteredReservation.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        ddlTO.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        ddlHotel.SelectedValue = ""
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If (gvGroups.Rows.Count > 0 Or gvReservations.Rows.Count > 0) Then
            'If CType(gvGroups.FindControl("cbAll"), CheckBox).Checked Then
            '    dsGroupRes.InsertParameters("ResGroup").DefaultValue = Nothing
            'Else
            '    dsGroupRes.InsertParameters("ResGroup").DefaultValue = gvGroups.SelectedValue
            'End If




            'If Not (gvGroups.Rows.Count > 0) Then
            '    dsGroupRes.InsertParameters("ResGroup").DefaultValue = Nothing
            'End If


            'Try
            '    dsGroupRes.Insert()
            'Catch ex As Exception
            '    If ex.InnerException IsNot Nothing Then
            '        popShow(False, "Error Creating ProForma", ex.InnerException.Message)
            '    End If
            'End Try


            Dim qr As New ProFormaTableAdapters.QueriesTableAdapter

            Dim hid As Nullable(Of Integer) = Nothing
            Dim toid As Nullable(Of Integer) = Nothing
            Dim chkin As Nullable(Of Date) = Nothing
            Dim chkout As Nullable(Of Date) = Nothing
            Dim resgroup As String = Nothing
            Dim username As String = Membership.GetUser.UserName


            hid = Int32.Parse(ddlHotel.SelectedValue)
            toid = Int32.Parse(ddlTO.SelectedValue)
            chkin = CDate(fltStart.Text)
            chkout = CDate(fltFinish.Text)


            If (gvGroups.Rows.Count > 0) Then
                resgroup = gvGroups.SelectedDataKey.Value
            End If


            Try
                qr.ProFormaInsert(hid, toid, chkin, chkout, username, resgroup)
            Catch ex As Exception
                If ex.InnerException IsNot Nothing Then
                    popShow(False, "Error Creating ProForma", ex.InnerException.Message)
                End If
            End Try

        End If
    End Sub

    Protected Sub gvGroups_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvGroups.RowCommand
        dsGroupRes.InsertParameters("ResGroup").DefaultValue = e.CommandArgument
    End Sub

    Protected Sub dsGroupRes_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsGroupRes.Inserted
        'If e.Exception IsNot Nothing Then
        '    popShow(False, "Error Creating ProForma", e.Exception.InnerException.Message)
        'End If
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

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        dsGroupRes.InsertParameters("ResGroup").DefaultValue = "all"
        dsFilteredReservation.SelectParameters("ResGroup").DefaultValue = Nothing
        gvReservations.DataBind()
    End Sub

    Protected Sub dsGroupRes_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsGroupRes.Inserting

    End Sub
End Class
