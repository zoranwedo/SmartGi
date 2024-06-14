Imports System.Data
Imports System.Data.SqlClient

Partial Class Contracts_Create_CreateFromContract
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub btCtrClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCtrClear.Click
        gvContracts.Visible = False

        txtContID.Text = Nothing
        ddlHotel.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlTO.SelectedValue = ""
        fltRateCode.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        'fltYear.Text = Nothing
        'ddlState.SelectedValue = ""
        'ddlContracts.SelectedValue = ""
    End Sub

    Protected Sub btCtrSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCtrSearch.Click
        gvContracts.DataSourceID = "dsFilteredContracts"
        gvContracts.Visible = True
        dsFilteredContracts.DataBind()
    End Sub

    Protected Sub btnCtrSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCtrSelect.Click
        If txtContID.Text = "" Then txtContID.Text = "0"
        gvContracts.DataSourceID = "dsSelectContract"
        gvContracts.Visible = True
        dsSelectContract.DataBind()
        gvContracts.Visible = True
    End Sub

    Protected Sub btToClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btToClear.Click
        gvTO.Visible = False

        ddlMarketsTO.SelectedValue = ""
        ddlPay.SelectedValue = ""
        fltActiveTO.Checked = True
        'fltCityTO.Text = Nothing
        'fltCountryTO.Text = Nothing
        fltNameTO.Text = Nothing
    End Sub

    Protected Sub btToSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btToSearch.Click
        gvTO.Visible = True
        gvTO.SelectedIndex = -1
    End Sub

    Protected Sub btCtrCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCtrCreate.Click
        If (String.IsNullOrEmpty(gvContracts.SelectedValue)) Then
            popShow("Error creating contracts", "No contract is selected!")
        Else
            Dim c As Integer = 0
            Dim err As Integer = 0
            Dim res As String = ""
            If gvTO.Visible Then
                Dim proc As New ContractsTableAdapters.QueriesTableAdapter
                Dim cid As Integer = Int32.Parse(gvContracts.SelectedValue)
                Dim uid As String = My.User.Name
                Dim toid As Integer
                Dim ch As Decimal
                Dim cht As String
                Dim sel As Boolean
                Dim r As Integer

                For Each row As GridViewRow In gvTO.Rows
                    sel = CType(row.FindControl("cbSel"), CheckBox).Checked
                    If sel Then
                        Try
                            ch = Decimal.Parse(CType(row.FindControl("txtRateChange"), TextBox).Text)
                            cht = CType(row.FindControl("rbChType"), RadioButtonList).SelectedValue
                            toid = Int32.Parse(CType(row.FindControl("txtTOID"), Label).Text)
                            proc.ContractCopyChange(cid, toid, ch, cht, uid, r)
                            res &= r.ToString & ", "
                            c += 1
                        Catch ex As Exception
                            row.ForeColor = Drawing.Color.Red
                            err += 1
                        End Try
                    End If
                Next
            End If

            lblTotalCreated.Text = "CREATED CONTRACTS: " & c.ToString
            lblTotalErrors.Text = "NOTCREATED CONTRACTS (ERRORS): " & err.ToString
            hfCreatedContracts.Value = res
            modResults.Show()
            gvResult.Visible = True
            gvResult.DataSource = GetResult(res)
            gvResult.DataBind()
        End If
    End Sub

    Function GetResult(ByVal res As String) As DataTable
        Dim q As String
        q = "SELECT c.ContractID,c.HotelId,c.Start,c.Finish,c.Title,c.StateId,c.CopyId,h.Hotel,t.TourOp,s.ContractState,r.RateCodeId " & _
            "FROM   [Contract] AS c INNER JOIN Hotel AS h ON  c.HotelId = h.HotelID " & _
            "       INNER JOIN TourOp AS t ON c.TourOpId = t.TourOpID " & _
            "       INNER JOIN ContractState AS s ON c.StateId = s.ContractStateID " & _
            "       INNER JOIN ContractRateType AS r ON  c.ContractID = r.ContractId " & _
            "WHERE  c.ContractID IN (@Results 0) " & _
            "ORDER BY h.SortPriority,t.TourOp,c.Start,c.StateId,c.ContractID"
        q = q.Replace("@Results", res)

        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString)
        Dim cmd As New SqlCommand
        Dim reader As SqlDataReader

        cmd.CommandText = q
        cmd.CommandType = CommandType.Text
        cmd.Connection = conn

        conn.Open()

        reader = cmd.ExecuteReader()
        Dim dt As New DataTable
        dt.Load(reader)
        conn.Close()

        Return dt
    End Function
End Class
