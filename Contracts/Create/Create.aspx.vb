
Partial Class Contracts_Create_Create
    Inherits System.Web.UI.Page
    Protected Sub dsContract_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsContract.Inserting
        Dim mrkt As New TourOperTableAdapters.TourOpTableAdapter
        Dim mrow As TourOper.TourOpRow = mrkt.GetDataByTOID(Int32.Parse(gvTO.SelectedValue)).Rows(0)

        e.InputParameters.Item("HotelID") = Int32.Parse(gvHotels.SelectedValue)
        e.InputParameters.Item("TourOpId") = Int32.Parse(gvTO.SelectedValue)
        e.InputParameters.Item("MarketId") = mrow.MarketId
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Not String.IsNullOrEmpty(ddlMarkets.SelectedValue) Then
            dsTOSearch.Select()
            gvTO.DataBind()
            gvTO.Visible = True
        Else
            popShow(False, "Warning", "You must select Market. It's required!")
            gvTO.Visible = False
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
    Protected Sub txtYear_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'If Not String.IsNullOrEmpty(CType(dvContract.FindControl("txtYear"), TextBox).Text) Then
        '    CType(dvContract.FindControl("ddlTitle"), DropDownList).DataBind()
        'End If
    End Sub

    Protected Sub dsContract_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContract.Inserted
        'Dim str As String = e.OutputParameters.Item("ContractID")
        Dim str As String = e.OutputParameters.Item("NewID")
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting contract", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            If Not (String.IsNullOrEmpty(str)) Then
                Response.Redirect(String.Format("~/Contracts/Wizard/Detail.aspx?ContractID={0}", str))
            End If
        End If
    End Sub

    Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        Dim Start As Nullable(Of Date) = Nothing
        Dim Finish As Nullable(Of Date) = Nothing
        Dim HotelID As Nullable(Of Integer) = Nothing
        Dim TourOpId As Nullable(Of Integer) = Nothing
        Dim CntYear As Nullable(Of Integer) = Nothing
        Dim qr As New ContractsTableAdapters.QueriesTableAdapter
        Dim pass As Integer
        Dim mess As String = "Validation is not passed."


        HotelID = Int32.Parse(gvHotels.SelectedValue)
        TourOpId = Int32.Parse(gvTO.SelectedValue)
        Start = Date.Parse(CType(FormView1.FindControl("StartTextBox"), TextBox).Text)
        Finish = Date.Parse(CType(FormView1.FindControl("FinishTextBox"), TextBox).Text)
        CntYear = Int32.Parse(CType(FormView1.FindControl("YearTextBox"), TextBox).Text)

        If (HotelID = Nothing Or TourOpId = Nothing Or Start = Nothing Or Finish = Nothing Or CntYear = Nothing) Then
            mess &= "You must input all requred fields."
            popShow(False, "Warning", mess)
            e.Cancel = True
        End If

        pass = qr.VAL_PreContractOverlaps(HotelID, TourOpId, Start, Finish)

        If pass = 0 Then
            mess &= "Contract is already exists"
            popShow(False, "Warning", mess)
        End If

    End Sub

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        dsHotels.Select()
        gvHotels.DataBind()
    End Sub

    Protected Sub ddlHotels_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotels.SelectedIndexChanged
        fltNameHtl.Text = ddlHotels.SelectedValue
        btnFilter_Click(sender, e)
    End Sub

    Protected Sub ddlTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTO.SelectedIndexChanged
        fltNameTO.Text = ddlTO.SelectedValue
        Button1_Click(sender, e)
    End Sub

    Protected Sub StartTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim Start As Nullable(Of Date) = Nothing
        'Dim Finish As Nullable(Of Date) = Nothing
        'Dim txtS As TextBox
        'Dim txtE As TextBox

        'If Not String.IsNullOrEmpty(CType(sender, TextBox).Text) Then
        '    txtS = CType(FormView1.FindControl("StartTextBox"), TextBox)
        '    txtE = CType(FormView1.FindControl("FinishTextBox"), TextBox)

        '    Start = Date.Parse(txtS.Text)
        '    Finish = DateAdd("d", 1, Start)
        '    txtE.Text = Finish
        'End If

    End Sub
End Class
