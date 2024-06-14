Imports System.Data.SqlClient

Partial Class Proforma_ProFormSGrid
    Inherits System.Web.UI.Page
    Private Const ChFields As Integer = 17

    Protected Function ExceptionText(ByRef ex As Exception) As String
        Dim result As String
        If ex.InnerException IsNot Nothing Then
            result = ex.InnerException.Message
        Else
            result = ex.Message
        End If

        Return result
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
            Dim BillID As Integer = Request.QueryString("BillingID")
            'lblTitle.Text = Request.QueryString("BillingID")

            Dim sConnection As New SqlConnection
            sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
            Dim sCommand As New SqlCommand()
            sCommand.CommandText = "SELECT RateID, RateCodeId, RateType, RateTypeID, HotelRate, HotelId, MealPlanId, RoomTypeId, TourOpId, " & _
                "MarketId, StateId, ContractId, SpecialId, SupplementId, ContractRateId, HotelPeriodId, HotelPeriodFlatId, " & _
                "PerPax, PerDay, RateOption, WeekDays, START, Finish, BookingCode, BkStart, BkFinish, StayCriteriaMin, " & _
                "StayCriteriaMax, IsMandatory, HotelVisible, RestrictEBB, Combinable, IsPercent, PrPropagate, HPP, HPercent, " & _
                "RatePax1 * HPercent RatePax1, RatePax2 * HPercent RatePax2, RatePax3 * HPercent RatePax3, RatePax4 * HPercent RatePax4, " & _
                "RatePax5 * HPercent RatePax5, RatePax6 * HPercent RatePax6, RatePax7 * HPercent RatePax7, RatePax8 * HPercent RatePax8, " & _
                "RatePax9 * HPercent RatePax9, RatePax10 * HPercent RatePax10, RateExtra * HPercent RateExtra, RateChld1 * HPercent RateChld1, " & _
                "RateChld2 * HPercent RateChld2, RateChld3 * HPercent RateChld3, RateChld4 * HPercent RateChld4, Title, DESCRIPTION, CtrTitle, " & _
                "CtrDecription, SpoTitle, SpoDescription, SpoTerms, CtrPeriodNote " & _
                "FROM dbo.InvRes_RateSelect(" & BillID.ToString & ") AS r ORDER BY START, RateType, Finish, RateCodeId"
            sConnection.Open()
            sCommand.Connection = sConnection
            Dim sReader As SqlDataReader = sCommand.ExecuteReader(Data.CommandBehavior.CloseConnection)
            gvStayRates.DataSource = sReader
            gvStayRates.DataBind()
        End If
    End Sub

    Protected Sub RateUpdate_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim BillID As Integer = Request.QueryString("BillingID")
        Dim RateID As Int64 = e.CommandArgument
        Dim UsrID As String = My.User.Name

        Dim sConnection As New SqlConnection
        sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        Dim sCommand As New SqlCommand()
        sCommand.CommandText = String.Format("EXEC [dbo].[InvRes_RateCalc] {0}, {1}, '{2}'", BillID, RateID, UsrID)
        sConnection.Open()
        sCommand.Connection = sConnection
        Try
            sCommand.ExecuteNonQuery()
            sConnection.Close()
            ClientScript.RegisterStartupScript(Me.GetType(), "onload", "okay();", True)
        Catch ex As Exception
            sConnection.Close()
            lblError.Text = ex.Message  ' ExceptionText(ex)
            lblError.Visible = True
            gvStayRates.Visible = False
            fvInfo.Visible = False
        End Try
    End Sub

    Protected Sub cbAllPax_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllPax.CheckedChanged
        gvStayRates.Columns(10).Visible = Not cbAllPax.Checked
        gvStayRates.Columns(11).Visible = cbAllPax.Checked
        gvStayRates.Columns(12).Visible = cbAllPax.Checked
        gvStayRates.Columns(13).Visible = cbAllPax.Checked
        gvStayRates.Columns(14).Visible = cbAllPax.Checked
        gvStayRates.Columns(15).Visible = cbAllPax.Checked
        gvStayRates.Columns(16).Visible = cbAllPax.Checked
        gvStayRates.Columns(17).Visible = cbAllPax.Checked
        'pnlRates.Width = 2000
    End Sub

    Protected Sub fvInfo_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvInfo.DataBound
        If gvStayRates.SelectedValue IsNot Nothing Then
            Dim id As Int64 = gvStayRates.SelectedValue
            Dim sConnection As New SqlConnection
            sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
            Dim sCommand As New SqlCommand()
            sCommand.CommandText = "SELECT cc.RateComment sihotComment FROM Rate r INNER JOIN ContractComment cc ON r.ContractId=cc.ContractID " & _
                "WHERE(r.RateID = " & id & ") UNION " & _
                "SELECT spoc.RateComment sihotComment FROM Rate r INNER JOIN SpecialComment spoc ON r.SpecialId=spoc.SpecialID " & _
                "WHERE(r.RateID = " & id & ") UNION " & _
                "SELECT supc.RateComment sihotComment FROM Rate r INNER JOIN SupplementComment supc ON r.SupplementId=supc.SupplementID " & _
                "WHERE(r.RateID = " & id & ")"
            sConnection.Open()
            sCommand.Connection = sConnection
            Dim sReader As SqlDataReader = sCommand.ExecuteReader(Data.CommandBehavior.CloseConnection)
            If sReader.HasRows Then
                rptComment.Visible = True
                rptComment.DataSource = sReader
                rptComment.DataBind()
            Else
                rptComment.Visible = False
            End If
        End If
    End Sub
End Class
