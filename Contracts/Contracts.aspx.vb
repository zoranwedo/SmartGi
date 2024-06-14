
Partial Class Contracts_Contracts
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
                Response.Redirect("ContractOverview.aspx?ContractID=" + txtContID.Text)
                Exit Sub
            End If
        End If
        txtContID.Text = Nothing
    End Sub

    Protected Sub gvContracts_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvContracts.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("ContractOverview.aspx?ContractID=" & e.CommandArgument)
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Contracts/Create/CreateCnt.aspx")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        txtContID.Text = Nothing
        'fltYear.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
      
        ddlTO.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlState.SelectedValue = ""
    End Sub
    Protected Sub ContractCookie()
        Dim cName As String = "Contracts_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try

                    If (Request.Cookies(cName)("CntHotel") IsNot Nothing) Then _
                        ddlHotel.SelectedIndex = Integer.Parse(Request.Cookies(cName)("CntHotel"))
                    If (Request.Cookies(cName)("CntAgency") IsNot Nothing) Then _
                        ddlTO.SelectedIndex = Integer.Parse(Request.Cookies(cName)("CntAgency"))
                    If (Request.Cookies(cName)("CntMarket") IsNot Nothing) Then _
                       ddlMarkets.SelectedIndex = Integer.Parse(Request.Cookies(cName)("CntMarket"))
                    If (Request.Cookies(cName)("CntState") IsNot Nothing) Then _
                        ddlState.SelectedIndex = Integer.Parse(Request.Cookies(cName)("CntState"))
                    If (Request.Cookies(cName)("CntStart") IsNot Nothing) Then _
                                        fltStart.Text = Request.Cookies(cName)("CntStart")
                    If (Request.Cookies(cName)("CntFifnish") IsNot Nothing) Then _
                        fltFinish.Text = Request.Cookies(cName)("CntFifnish")

                    If (Request.Cookies(cName)("CntPage") IsNot Nothing) Then _
                        gvContracts.PageIndex = Integer.Parse(Request.Cookies(cName)("CntPage"))
                    If (Request.Cookies(cName)("CntIndex") IsNot Nothing) Then _
                        gvContracts.SelectedIndex = Integer.Parse(Request.Cookies(cName)("CntIndex"))
                
                   
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            'Dim CheckIn As Nullable(Of Date) = Nothing
            'Dim CheckOut As Nullable(Of Date) = Nothing

            'If Not (fltStart.Text Is Nothing) Then CheckIn = fltStart.Text
            'If Not (fltFinish.Text Is Nothing) Then CheckOut = fltFinish.Text

         
            Response.Cookies(cName)("CntHotel") = ddlHotel.SelectedIndex.ToString
            Response.Cookies(cName)("CntAgency") = ddlTO.SelectedIndex.ToString
            Response.Cookies(cName)("CntMarket") = ddlMarkets.SelectedIndex.ToString
            Response.Cookies(cName)("CntState") = ddlState.SelectedIndex.ToString
            Response.Cookies(cName)("CntStart") = fltStart.Text
            Response.Cookies(cName)("CntFifnish") = fltFinish.Text
            Response.Cookies(cName)("CntPage") = gvContracts.PageIndex.ToString
            Response.Cookies(cName)("CntIndex") = gvContracts.SelectedIndex.ToString
          
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ContractCookie()
    End Sub
End Class
