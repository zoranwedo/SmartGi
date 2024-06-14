Imports System.Data.SqlClient

Partial Class Invoices_InvoiceFormSGrid
    Inherits System.Web.UI.Page
    Private Const ChFields As Integer = 17
    'Private Const ChFields As Integer = 10

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
            Dim p As New dsInvoiceFormTableAdapters.HotelPolicyTableAdapter
            Dim t As dsInvoiceForm.HotelPolicyDataTable = p.GetDataByBilling(BillID)
            Dim r As dsInvoiceForm.HotelPolicyRow

            If t IsNot Nothing Then
                If t.Rows.Count > 0 Then
                    r = t.Rows(0)
                    If Not r.IsChld1ShLabelNull Then gvStayRates.Columns(ChFields + 1).HeaderText = r.Chld1ShLabel
                    If Not r.IsChld2ShLabelNull Then gvStayRates.Columns(ChFields + 2).HeaderText = r.Chld2ShLabel
                    If Not r.IsChld3ShLabelNull Then gvStayRates.Columns(ChFields + 3).HeaderText = r.Chld3ShLabel
                    If Not r.IsChld4ShLabelNull Then gvStayRates.Columns(ChFields + 4).HeaderText = r.Chld4ShLabel
                End If
            End If

            Dim sp As New dsInvoiceFormTableAdapters.Rate_SelectByBillTableAdapter
            'Dim st As dsInvoiceForm.Rate_SelectByBillDataTable = sp.GetData(BillID)
            'gvStayRates.DataSource = st
            'gvStayRates.DataBind()

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
                "FROM dbo.Rate_SelectByBill_V1(" & BillID.ToString & ") AS r ORDER BY START, RateType, Finish"
            sConnection.Open()
            sCommand.Connection = sConnection
            Dim sReader As SqlDataReader = sCommand.ExecuteReader(Data.CommandBehavior.CloseConnection)
            gvStayRates.DataSource = sReader
            gvStayRates.DataBind()
        End If
    End Sub

    Protected Sub RateUpdate_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim BillID As Integer = Request.QueryString("BillingID")
        Dim newRateID As Integer = e.CommandArgument
        Dim newRateCD As String = e.CommandName

        Dim stayQ As New dsInvoiceFormTableAdapters.LogRateUpdateTableAdapter
        Dim stayT As dsInvoiceForm.LogRateUpdateDataTable = stayQ.GetDataByBilling(BillID)
        Dim stayR As dsInvoiceForm.LogRateUpdateRow = stayT.Rows(0)

        Dim logUSR As String = My.User.Name
        Dim logTXT As String = "Stay rate for invoice stay detail " & stayR.DetailID.ToString & "/" & stayR.DetText & " update"
        Dim logTO As String = " to " & newRateID.ToString & "/" & newRateCD
        If Not stayR.IsRateIDNull Then
            logTO = " from " & stayR.RateID.ToString & "/" & stayR.RateCodeId & logTO
        Else
            logTO = " from NO RATE " & logTO
        End If

        Dim l As New LogApp
        Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, stayR.InvoiceId, logTXT & logTO)
            q.InvBillUpdateRate(stayR.InvoiceId, stayR.DetailID, BillID, newRateID)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, stayR.InvoiceId, logTXT & "ed" & logTO)
            ClientScript.RegisterStartupScript(Me.GetType(), "onload", "okay();", True)
        Catch ex As Exception
            logTXT += logTO & " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, stayR.InvoiceId, logTXT)
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
End Class
