
Partial Class Contracts_Wizard_Create
    Inherits System.Web.UI.Page


    Protected Sub dsContract_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsContract.Inserting
        e.InputParameters.Item("HotelID") = Int32.Parse(gvHotels.SelectedValue)
        e.InputParameters.Item("TourOpId") = Int32.Parse(gvTO.SelectedValue)
        e.InputParameters.Item("MarketId") = ddlMarkets.SelectedValue
    End Sub
    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick

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

    'Protected Sub dsCntTitle_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsCntTitle.Selecting
    '    'If Not String.IsNullOrEmpty(CType(dvContract.FindControl("txtYear"), TextBox).Text) Then
    '    'If Not String.IsNullOrEmpty(txtYear.Text) Then
    '    '    e.InputParameters.Item("ContractYear") = txtYear.Text
    '    '    'ddlTitle.DataBind()
    '    'End If
    'End Sub

    Protected Sub txtYear_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'If Not String.IsNullOrEmpty(CType(dvContract.FindControl("txtYear"), TextBox).Text) Then
        '    CType(dvContract.FindControl("ddlTitle"), DropDownList).DataBind()
        'End If
    End Sub
    'Public Property CntYear() As String
    '    Get
    '        Return CType(dvContract.FindControl("txtYear"), TextBox).Text
    '    End Get
    '    Set(ByVal value As String)
    '        CType(dvContract.FindControl("txtYear"), TextBox).Text = value
    '    End Set
    'End Property
    'Public Property CntTitle() As String
    '    Get
    '        Return CType(dvContract.FindControl("ddlTitle"), DropDownList).SelectedValue
    '    End Get
    '    Set(ByVal value As String)
    '        CType(dvContract.FindControl("ddlTitle"), DropDownList).SelectedValue = value
    '    End Set
    'End Property

    Protected Sub dsContract_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContract.Inserted
        'Dim str As String = e.OutputParameters.Item("ContractID")
        Dim str As String = e.OutputParameters.Item("NewID")
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting contract", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            If Not (String.IsNullOrEmpty(str)) Then
                Response.Redirect(String.Format("Detail.aspx?ContractID={0}", str))
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
        End If

        pass = qr.VAL_PreContractOverlaps(HotelID, TourOpId, Start, Finish)

        If pass = 0 Then
            mess &= "Contract is already exists"
            popShow(False, "Warning", mess)
            ' e.Cancel = True
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

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click

    End Sub
End Class
