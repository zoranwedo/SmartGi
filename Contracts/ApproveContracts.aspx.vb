
Partial Class Contracts_ApproveContracts
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsFilteredContracts.Select()
        gvContracts.DataBind()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        Dim cid As Integer

        If Int32.TryParse(txtContID.Text, cid) Then
            Dim q As New ContractsTableAdapters.ContractByIDTableAdapter
            Dim t As Contracts.ContractByIDDataTable = q.GetData(cid)
            If t.Count > 0 Then
                Response.Redirect("Approve/AppContractRates.aspx?ContractID=" + txtContID.Text)
                Exit Sub
            End If
        End If
        txtContID.Text = Nothing
    End Sub

    Protected Sub gvContracts_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvContracts.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("Approve/AppContractRates.aspx?ContractID=" & e.CommandArgument)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        txtContID.Text = Nothing
        fltName.Text = Nothing
        fltRateCode.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltImpDate.Text = Nothing

        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlState.SelectedValue = ""
    End Sub

    Protected Sub ContractCookie()
        Dim cName As String = "Contracts_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try

                    If (Request.Cookies(cName)("AppCntName") IsNot Nothing) Then fltName.Text = Request.Cookies(cName)("AppCntName")
                    If (Request.Cookies(cName)("AppCntRateCode") IsNot Nothing) Then fltRateCode.Text = Request.Cookies(cName)("AppCntRateCode")
                    If (Request.Cookies(cName)("AppCntStart") IsNot Nothing) Then fltStart.Text = Request.Cookies(cName)("AppCntStart")
                    If (Request.Cookies(cName)("AppCntFifnish") IsNot Nothing) Then fltFinish.Text = Request.Cookies(cName)("AppCntFifnish")
                    If (Request.Cookies(cName)("AppCntImpDate") IsNot Nothing) Then fltImpDate.Text = Request.Cookies(cName)("AppCntImpDate")

                    If (Request.Cookies(cName)("AppCntMarket") IsNot Nothing) Then ddlMarkets.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AppCntMarket"))
                    If (Request.Cookies(cName)("AppCntHotel") IsNot Nothing) Then ddlHotel.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AppCntHotel"))
                    If (Request.Cookies(cName)("AppCntAgency") IsNot Nothing) Then ddlTO.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AppCntAgency"))
                    If (Request.Cookies(cName)("AppCntState") IsNot Nothing) Then ddlState.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AppCntState"))

                    If (Request.Cookies(cName)("AppCntPage") IsNot Nothing) Then gvContracts.PageIndex = Integer.Parse(Request.Cookies(cName)("AppCntPage"))
                    If (Request.Cookies(cName)("AppCntIndex") IsNot Nothing) Then gvContracts.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AppCntIndex"))

                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then

            Response.Cookies(cName)("AppCntName") = fltName.Text
            Response.Cookies(cName)("AppCntRateCode") = fltRateCode.Text
            Response.Cookies(cName)("AppCntStart") = fltStart.Text
            Response.Cookies(cName)("AppCntFifnish") = fltFinish.Text
            Response.Cookies(cName)("AppCntImpDate") = fltImpDate.Text

            Response.Cookies(cName)("AppCntMarket") = ddlMarkets.SelectedIndex.ToString
            Response.Cookies(cName)("AppCntHotel") = ddlHotel.SelectedIndex.ToString
            Response.Cookies(cName)("AppCntAgency") = ddlTO.SelectedIndex.ToString
            Response.Cookies(cName)("AppCntState") = ddlState.SelectedIndex.ToString

            Response.Cookies(cName)("AppCntPage") = gvContracts.PageIndex.ToString
            Response.Cookies(cName)("AppCntIndex") = gvContracts.SelectedIndex.ToString
          
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ContractCookie()
    End Sub
End Class
