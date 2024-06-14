Imports System.Data
Imports System.Data.SqlClient

Partial Class Contracts_Create_CreateFromContactYear
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

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        If (String.IsNullOrEmpty(gvContracts.SelectedValue)) Then
            popShow("Error creating contract", "No contract is selected!")
        Else
            Dim r As Integer = 0
            Dim proc As New ContractsTableAdapters.QueriesTableAdapter
            Dim cid As Integer = Int32.Parse(gvContracts.SelectedValue)
            Dim uid As String = My.User.Name
            Dim y As Integer = Integer.Parse(txtYear.Text)
            Dim tit As String = ddlTitle.SelectedValue
            Dim ch As Decimal = Decimal.Parse(txtRateChange.Text)
            Dim cht As String = rbChType.SelectedValue

            Try
                'proc.ContractChangeYear(cid, tit, y, ch, uid)
                proc.ContractChangeYearChange(cid, tit, y, ch, cht, uid, r)
                lblTotalCreated.Text = "CONTRACT CREATED SUCCESFULLY"
            Catch ex As Exception
                lblTotalCreated.Text = "ERROR CREATING CONTRACT <br />" & ex.Message
            End Try

            hfCreatedContracts.Value = r
            modResults.Show()
            gvResult.Visible = True
            gvResult.DataSource = GetResult(r)
            gvResult.DataBind()
        End If
    End Sub

    Function GetResult(ByVal r As Integer) As DataTable
        Dim q As String
        q = "SELECT c.ContractID,c.HotelId,c.Start,c.Finish,c.Title,c.StateId,c.CopyId,h.Hotel,t.TourOp,s.ContractState,r.RateCodeId " & _
            "FROM   [Contract] AS c INNER JOIN Hotel AS h ON  c.HotelId = h.HotelID " & _
            "       INNER JOIN TourOp AS t ON c.TourOpId = t.TourOpID " & _
            "       INNER JOIN ContractState AS s ON c.StateId = s.ContractStateID " & _
            "       INNER JOIN ContractRateType AS r ON  c.ContractID = r.ContractId " & _
            "WHERE  c.ContractID = @Result " & _
            "ORDER BY h.SortPriority,t.TourOp,c.Start,c.StateId,c.ContractID"
        q = q.Replace("@Result", r.ToString)

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
