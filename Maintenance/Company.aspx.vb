
Partial Class Maintenance_Company
    Inherits System.Web.UI.Page

    Protected Sub dvCompany_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles dvCompany.ItemCommand
        If e.CommandName = "DelCompany" Then
            Dim a As New dsCompanyTableAdapters.CompanyTableAdapter
            Dim cID As Integer = e.CommandArgument
            a.DeleteCompany(cID)
            ddlCompanies.DataBind()
        End If
    End Sub

    Protected Sub dsCompany_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCompany.Inserted
        ddlCompanies.DataBind()
    End Sub

    Protected Sub dvCompany_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvCompany.ModeChanged
        dvCompany.Fields(0).Visible = dvCompany.CurrentMode <> DetailsViewMode.ReadOnly
    End Sub

    Protected Sub fvAddHotel_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvAddHotel.ItemCommand
        If e.CommandName = "AddHotel" Then
            Dim hID = CType(fvAddHotel.FindControl("ddlAddHotel"), DropDownList).SelectedValue
            Dim cID = ddlCompanies.SelectedValue

            Dim ta As New dsCompanyTableAdapters.CompanyHotelTableAdapter
            ta.AddHotel(cID, hID)
            fvAddHotel.ChangeMode(FormViewMode.ReadOnly)
            fvAddHotel.DataBind()
            gvHotels.DataBind()
        End If
    End Sub

    Protected Sub ddlLayout_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlLayout As DropDownList = sender
        Dim imgLayout As Image = dvCompany.FindControl("imgLayout")
        If ddlLayout.SelectedValue = 0 Then
            imgLayout.ImageUrl = "~/Images/InvLayout/RefDate.gif"
        Else
            imgLayout.ImageUrl = "~/Images/InvLayout/RefHotel.gif"
        End If
    End Sub

    Protected Sub dvCompany_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvCompany.DataBound
        If dvCompany.Rows.Count > 1 Then
            Dim ddlLayout As DropDownList = dvCompany.FindControl("ddlLayout")
            Dim hfLayout As HiddenField = dvCompany.FindControl("hfLayout")
            Dim imgLayout As Image = dvCompany.FindControl("imgLayout")

            Dim i = hfLayout.Value
            If ddlLayout IsNot Nothing Then i = ddlLayout.SelectedValue

            If i = 0 Then
                imgLayout.ImageUrl = "~/Images/InvLayout/RefDate.gif"
            Else
                imgLayout.ImageUrl = "~/Images/InvLayout/RefHotel.gif"
            End If
        End If
    End Sub

    Protected Sub dsCompany_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsCompany.Inserting
        e.InputParameters("Active") = True
        If e.InputParameters("Hotel2Cedar") Is Nothing Then e.InputParameters("Hotel2Cedar") = e.InputParameters("Company")
        If e.InputParameters("Cedar2TourOp") Is Nothing Then e.InputParameters("Cedar2TourOp") = e.InputParameters("Company")
    End Sub
End Class
