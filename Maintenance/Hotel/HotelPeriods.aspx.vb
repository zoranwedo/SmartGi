
Partial Class Maintenance_Hotel_HotelPeriods
    Inherits System.Web.UI.Page

    Protected Sub dvPeriod_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvPeriod.DataBound
        If gridPeriods.Rows.Count > 0 Then
            pnlPeriod.Visible = True
            'If dvPeriod.SelectedValue IsNot Nothing Then
            '    Dim p As New dsMaintHotelTableAdapters.QueriesTableAdapter
            '    pnGenerate.Visible = p.CanGenerateFlatRates(Int32.Parse(dvPeriod.SelectedValue))
            'Else
            '    pnGenerate.Visible = False
            'End If

            If gridPeriods.SelectedRow IsNot Nothing Then
                pnlRates.Visible = (Int32.Parse(gridPeriods.SelectedDataKey("PeriodType")) = 0)
            Else
                pnlRates.Visible = False
            End If
        Else
            'pnGenerate.Visible = False
            pnlRates.Visible = False
            pnlPeriod.Visible = False Or (dvPeriod.CurrentMode = DetailsViewMode.Insert)
        End If
    End Sub

    Protected Sub gridRates_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRates.DataBinding
        Dim p As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim r As dsMaintHotel.HotelOcuppancyRow = p.GetData(Int32.Parse(Request.QueryString(0))).Rows(0)

        If r IsNot Nothing Then

            Dim i As Integer

            For i = 7 + r.MaxOccupancy To 16
                gridRates.Columns(i).Visible = False
            Next

            gridRates.Columns(17).Visible = r.ChldCategories > 0
            If Not r.IsChld1ShLabelNull Then gridRates.Columns(17).HeaderText = r.Chld1ShLabel
            If Not r.IsChld1AgShLabelNull Then gridRates.Columns(17).FooterText = r.Chld1AgShLabel
            gridRates.Columns(18).Visible = r.ChldCategories > 1
            If Not r.IsChld2ShLabelNull Then gridRates.Columns(18).HeaderText = r.Chld2ShLabel
            If Not r.IsChld2AgShLabelNull Then gridRates.Columns(18).FooterText = r.Chld2AgShLabel
            gridRates.Columns(19).Visible = r.ChldCategories > 2
            If Not r.IsChld3ShLabelNull Then gridRates.Columns(19).HeaderText = r.Chld3ShLabel
            If Not r.IsChld3AgShLabelNull Then gridRates.Columns(19).FooterText = r.Chld3AgShLabel
            gridRates.Columns(20).Visible = r.ChldCategories > 3
            If Not r.IsChld4ShLabelNull Then gridRates.Columns(20).HeaderText = r.Chld4ShLabel
            If Not r.IsChld4AgShLabelNull Then gridRates.Columns(20).FooterText = r.Chld4AgShLabel
        End If

    End Sub

    Protected Sub gridPeriods_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridPeriods.RowCommand
        If e.CommandName = "NewPeriod" Then
            pnlPeriod.Visible = True
            dvPeriod.ChangeMode(DetailsViewMode.Insert)
        ElseIf e.CommandName = "Recalc" Then
            Dim p As New dsMaintHotelTableAdapters.QueriesTableAdapter
            'p.HotelPeriodRecalculate(0) 
            p.HotelPeriodRecalculate(Int32.Parse(gridPeriods.SelectedValue.ToString))
            gridPeriods.DataBind()
        End If
    End Sub


    Protected Sub ddlInsType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim t As TextBox = dvPeriod.FindControl("txtInsPc")
        If t IsNot Nothing Then
            t.Visible = CType(sender, DropDownList).SelectedValue = 1
        End If
    End Sub

    Protected Sub ddlEdType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim t As TextBox = dvPeriod.FindControl("txtEdPc")
        If t IsNot Nothing Then
            t.Visible = CType(sender, DropDownList).SelectedValue = 1
        End If
    End Sub

    Protected Sub dsSelPeriod_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSelPeriod.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting period", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
            dvPeriod.DataBind()
        End If
    End Sub

    Protected Sub dsSelPeriod_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSelPeriod.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting period", e.Exception.Message)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
            dvPeriod.DataBind()
        End If
    End Sub

    Protected Sub dsSelPeriod_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSelPeriod.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing period", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
            dvPeriod.DataBind()
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

    Protected Sub btGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If dvPeriod.SelectedValue IsNot Nothing Then
            Dim p As New dsMaintHotelTableAdapters.QueriesTableAdapter
            p.HotelPeriod_FlatRate(Int32.Parse(dvPeriod.SelectedValue))
            gridRates.DataBind()
        End If
    End Sub

    Protected Sub lbRacalc_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
