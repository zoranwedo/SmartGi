
Partial Class Maintenance_SihotMap_MapChildSet
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.InnerException.Message
                Else
                    popMessage.Text = ex.Message
                End If
            Catch e As Exception
                popMessage.Text = ex.ToString
            End Try
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub btOverview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btOverview.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Dim sublr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Maintenance\SihotMap\MapChildSet.rdlc"

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsMapChildSet_ChildSetOverview", dsOverview))
        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""ChildSetsOverview.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub ddlRoomType_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddl As DropDownList = sender
        ddl.Items.Clear()
        ddl.Items.Add(New ListItem("all", ""))
    End Sub

    Protected Sub fvSet_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSet.ItemCommand
        Dim en As Boolean = e.CommandName <> "Edit"
        gvChildSets.Enabled = en
        gvSetFor.Enabled = en
        fvSetFor.Enabled = en
    End Sub

    Protected Sub fvSetFor_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvSetFor.ItemInserting
        e.Values("RoomTypeID") = CType(fvSetFor.FindControl("ddlRoomType"), DropDownList).SelectedValue
    End Sub

    Protected Sub gvSetFor_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvSetFor.RowUpdating
        e.NewValues("RoomTypeID") = CType(gvSetFor.Rows(e.RowIndex).FindControl("ddlRoomType"), DropDownList).SelectedValue
    End Sub

    Protected Sub dsSet_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSet.Inserted
        If e.Exception Is Nothing Then
            dsChildSets.DataBind()
            gvChildSets.DataBind()
        Else
            Me.popShow("Child Set Insert ERROR", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsSet_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSet.Deleted
        If e.Exception Is Nothing Then
            dsChildSets.DataBind()
            gvChildSets.DataBind()
            gvChildSets.SelectedIndex -= 1
        Else
            Me.popShow("Child Set Delete ERROR", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsSet_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSet.Updated
        If e.Exception IsNot Nothing Then
            Me.popShow("Child Set Update ERROR", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsSetFor_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSetFor.Inserted
        If e.Exception IsNot Nothing Then
            Me.popShow("Child Set Application Insert ERROR", e.Exception)
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub dsSetFor_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSetFor.Deleted
        If e.Exception IsNot Nothing Then
            Me.popShow("Child Set Application Delete ERROR", e.Exception)
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub dsSetFor_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSetFor.Updated
        If e.Exception IsNot Nothing Then
            Me.popShow("Child Set Application Update ERROR", e.Exception)
            e.ExceptionHandled = True
        End If

    End Sub
End Class
