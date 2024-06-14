Imports System.Data.SqlClient

Partial Class Proforma_ProFormPGrid
    Inherits System.Web.UI.Page

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
            Dim DetailID As Integer = Request.QueryString("DetailID")

            Dim sConnection As New SqlConnection
            sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
            Dim sCommand As New SqlCommand()
            sCommand.CommandText = "SELECT RateID, RateCodeId, RateType, RateTypeID, HotelRate, HotelId, MealPlanId, " & _
                "RoomTypeId, TourOpId, MarketId, StateId, ContractId, SpecialId, SupplementId, ContractRateId, " & _
                "HotelPeriodId, HotelPeriodFlatId, PerPax, PerDay, RateOption, WeekDays, Start, Finish, BookingCode, " & _
                "BkStart, BkFinish, StayCriteriaMin, StayCriteriaMax, IsMandatory, HotelVisible, RestrictEBB, " & _
                "Combinable, IsPercent, PrPropagate, HPP, HPercent, " & _
                "CASE IsPercent WHEN 1 THEN RateAdult ELSE RateAdult * HPercent END RateAdult, " & _
                "CASE IsPercent WHEN 1 THEN RateExtra ELSE RateExtra * HPercent END RateExtra, " & _
                "CASE IsPercent WHEN 1 THEN RateChild ELSE RateChild * HPercent END RateChild, " & _
                "Title, Description, CtrTitle, CtrDecription, SupTitle, SupDescription " & _
                "FROM dbo.InvRes_RateSelectSupp(" & DetailID.ToString & ") AS r ORDER BY START, RateType, Finish, RateCodeId"
            sConnection.Open()
            sCommand.Connection = sConnection
            Dim sReader As SqlDataReader = sCommand.ExecuteReader(Data.CommandBehavior.CloseConnection)
            gvSuppRates.DataSource = sReader
            gvSuppRates.DataBind()
        End If
    End Sub

    Protected Sub SuppInsert_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim InvoiceID As Integer = Request.QueryString("InvoiceID")
        Dim DetailID As Integer = Request.QueryString("DetailID")
        Dim All As Boolean = Request.QueryString("All")
        Dim RateID As Int64 = e.CommandArgument
        Dim UsrID As String = My.User.Name

        Dim sConnection As New SqlConnection
        sConnection.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        Dim sCommand As New SqlCommand()
        If All Then
            sCommand.CommandText = String.Format("EXEC [dbo].[InvRes_SupplementCalcAll] '{0}', {1}, {2}, {3}", UsrID, InvoiceID, DetailID, RateID)
        Else
            sCommand.CommandText = String.Format("EXEC [dbo].[InvRes_SupplementCalc] '{0}', {1}, {2}, {3}", UsrID, InvoiceID, DetailID, RateID)
        End If
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
            gvSuppRates.Visible = False
            fvInfo.Visible = False
        End Try
    End Sub
End Class
