Imports App_UserControls_MessagePop

Partial Class Maintenance_CRS_CrsMatrix
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then fltHotel.SelectedIndex = 1
        'dlMatrix.DataBind()
    End Sub

    Protected Sub gvSihotMapp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        If gv.SelectedIndex > -1 Then
            Dim htlNum As Integer = gv.SelectedDataKey.Item("HOTEL-NO")
            Dim htlComplex As String = gv.SelectedDataKey.Item("COMPLEX-CODE")
            Dim htlName As String = gv.SelectedDataKey.Item("Hotel")

            Dim pop As PopupControlExtender = fvMatrixNew.Row.FindControl("popSihotMapp")
            Dim ddlHotelCode As TextBox = fvMatrixNew.Row.FindControl("ddlHotelCode")
            Dim ddlComplexCode As TextBox = fvMatrixNew.Row.FindControl("ddlComplexCode")
            Dim ddlHotel As TextBox = fvMatrixNew.Row.FindControl("ddlHotel")
            ddlHotelCode.Text = htlNum.ToString
            ddlComplexCode.Text = htlComplex
            ddlHotel.Text = htlName
            'pop.Cancel()
            pop.Commit(htlNum)
        End If

    End Sub

    Protected Sub dsMatrix_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsMatrix.Inserting
        Try
            Dim ddlMarketID As DropDownList = fvMatrixNew.Row.FindControl("ddlMarketID")
            Dim ddlHotelCode As TextBox = fvMatrixNew.Row.FindControl("ddlHotelCode")
            Dim ddlComplexCode As TextBox = fvMatrixNew.Row.FindControl("ddlComplexCode")
            Dim ddlCompName As DropDownList = fvMatrixNew.Row.FindControl("ddlCompName")
            Dim ddlTourOpID As DropDownList = fvMatrixNew.Row.FindControl("ddlTourOpID")

            e.InputParameters("MarketID") = ddlMarketID.SelectedValue
            e.InputParameters("HotelCode") = ddlHotelCode.Text
            e.InputParameters("ComplexCode") = ddlComplexCode.Text
            e.InputParameters("CompanyCID") = ddlCompName.SelectedValue
            e.InputParameters("ChangeUser") = My.User.Name
            e.InputParameters("TourOpID") = IIf(String.IsNullOrEmpty(ddlTourOpID.SelectedValue), Nothing, ddlTourOpID.SelectedValue)
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try

    End Sub

    Protected Sub dlMatrix_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlMatrix.EditCommand
        dlMatrix.EditItemIndex = e.Item.ItemIndex
        dlMatrix.DataBind()
    End Sub

    Protected Sub dlMatrix_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlMatrix.CancelCommand
        dlMatrix.EditItemIndex = -1
        dlMatrix.DataBind()
    End Sub

    Protected Sub dlMatrix_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlMatrix.DeleteCommand
        Dim mapID As Integer = e.CommandArgument
        Try
            Dim q As New dsCRSTableAdapters.crsConnectedMatrixTableAdapter
            q.DeleteQuery(My.User.Name, mapID)
            dlMatrix.DataBind()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub fvMatrixNew_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvMatrixNew.ItemInserted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub dsMatrix_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMatrix.Inserted
        If e.Exception IsNot Nothing Then
            If e.Exception.InnerException.Message.Contains("AK_crsConnectedMatrix") Then
                msgPop.ShowError(New Exception("This mapping already exists. Action is cancelled."))
            Else
                msgPop.ShowError(e.Exception)
            End If
        Else
            dlMatrix.DataBind()
        End If
    End Sub

    Protected Sub btnConpany_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim pnlNewCompany As Panel = fvMatrixNew.FindControl("pnlNewCompany")
        Dim btnConpany As LinkButton = fvMatrixNew.FindControl("btnConpany")
        pnlNewCompany.Visible = True
        btnConpany.Visible = False
    End Sub


    Protected Sub btCompanyInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlCompName As DropDownList = fvMatrixNew.FindControl("ddlCompName")
        Dim btnConpany As LinkButton = fvMatrixNew.FindControl("btnConpany")
        Dim pnlNewCompany As Panel = fvMatrixNew.FindControl("pnlNewCompany")
        Dim txtNewCentralID As TextBox = pnlNewCompany.FindControl("txtNewCentralID")
        Dim txtNewCompanyName As TextBox = pnlNewCompany.FindControl("txtNewCompanyName")

        Dim centralID As Int64 = txtNewCentralID.Text
        Dim companyName As String = txtNewCompanyName.Text
        Dim q As dsCRSTableAdapters.MapSihotCompaniesTableAdapter = New dsCRSTableAdapters.MapSihotCompaniesTableAdapter()
        Try
            q.Insert(centralID, companyName)

            Dim fltCompanySel As String = fltCompany.SelectedValue

            dsSihotTourOp.Select()
            dsSihotTourOp.DataBind()

            fltCompany.Items.Clear()
            fltCompany.Items.Add(New ListItem("...", ""))
            fltCompany.DataBind()
            fltCompany.SelectedValue = fltCompanySel

            ddlCompName.Items.Add(New ListItem(String.Format("({0}) {1}", centralID, companyName), centralID.ToString()))
            ddlCompName.SelectedValue = centralID.ToString()
        Catch ex As Exception
            ddlCompName.SelectedValue = centralID.ToString()
        Finally
            pnlNewCompany.Visible = False
            btnConpany.Visible = True
        End Try
    End Sub


    Protected Sub btCompanyCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim pnlNewCompany As Panel = fvMatrixNew.FindControl("pnlNewCompany")
        Dim btnConpany As LinkButton = fvMatrixNew.FindControl("btnConpany")
        pnlNewCompany.Visible = False
        btnConpany.Visible = True
    End Sub

End Class
