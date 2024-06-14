Imports App_UserControls_MessagePop

Partial Class Accounting_masterAccounting
    Inherits System.Web.UI.MasterPage

    Protected Function ShowPayments() As String
        Return "{" & String.Format(" ShowPaymentModalEdit({0}); return false;", Request.QueryString("DocumentID")) & "}"
    End Function

    Public Function ResAmountGt0(ByVal ResAmount As Object) As Boolean
        If ResAmount Is DBNull.Value Then
            Return False
        Else
            Dim r As Decimal = ResAmount
            Return r > 0
        End If
    End Function

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim did As Integer = Integer.Parse(Request.QueryString("DocumentID"))

        Try
            Dim taStatus As New dsAccountingTableAdapters.SelectAccDocStatusTableAdapter
            Dim rStatus As dsAccounting.SelectAccDocStatusRow = taStatus.GetData(did, My.User.Name)(0)
            hfShwPayMode.Value = rStatus.showPayMode
            hfCanEdit.Value = rStatus.canEdit
            hfCanApply.Value = rStatus.canApply
            hfBalance.Value = rStatus.Balance
            hfHBalance.Value = rStatus.HBalance
        Catch ex As Exception
            hfShwPayMode.Value = False
            hfCanEdit.Value = False
            hfCanApply.Value = False
            hfBalance.Value = 0
            hfHBalance.Value = 0
        End Try

        Try
            Dim taCamModify As New dsAccountingTableAdapters.QueriesTableAdapter
            Dim bCamModify As Boolean = taCamModify.AccDocCanModify(did)
            hfCanModify.Value = bCamModify And (My.User.IsInRole("admin") Or My.User.IsInRole("accoutning_admin"))
        Catch ex As Exception
            hfCanModify.Value = False
        End Try
    End Sub

    Protected Sub LocalMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LocalMenu.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?DocumentID=" & Request.QueryString(0)
            Next
            LocalMenu.Enabled = Integer.Parse(Request.QueryString(0)) <> 0
        End If
    End Sub

    Protected Sub AccountContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles AccountContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
        Next
    End Sub

    Protected Sub fvDocument_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvDocument.DataBound
        If Not IsInvoice() And LocalMenu.Items.Count > 3 Then LocalMenu.Items.RemoveAt(3)
    End Sub

    Protected Sub fvDocument_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvDocument.ItemCreated
        If IsInvoice() = False Then
            LocalMenu.Items(LocalMenu.Items.Count - 1).Enabled = False
        Else
            For Each i As MenuItem In LocalMenu.Items
                i.Enabled = True
            Next
        End If
    End Sub

    Protected Sub fvDocument_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvDocument.ItemCommand
        If e.CommandName = "Unaprove" Then
            Dim did As Integer = Request.QueryString("DocumentID")
            Dim uid As String = My.User.Name
            Dim ta As New dsAccountingTableAdapters.QueriesTableAdapter
            Try
                ta.AccRegistrationDocApprove(did, False, Now, uid)
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception
                msgPop.Title = "Document Unapprove"
                msgPop.ShowError(ex)
            End Try
        ElseIf e.CommandName = "Approve" Then
            Dim did As Integer = Request.QueryString("DocumentID")
            Dim adt As Date = Date.Parse(CType(fvDocument.FindControl("txtAppDate"), TextBox).Text)
            Dim uid As String = My.User.Name
            Dim ta As New dsAccountingTableAdapters.QueriesTableAdapter
            Try
                ta.AccRegistrationDocApprove(did, True, adt, uid)
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception
                msgPop.Title = "Document Approve"
                msgPop.ShowError(ex)
            End Try
        End If
    End Sub

    Protected Sub btNewDoc_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Accounting/AccRegisterDoc.aspx")
    End Sub

    Protected Sub btRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btRefresh.Click
        RefreshHeader()
    End Sub

    Public Sub RefreshHeader()
        fvDocument.DataBind()
        fvDocLog.DataBind()
    End Sub

    Public ReadOnly Property GetdsDocHeader() As ObjectDataSource
        Get
            Return dsDocHeader
        End Get
    End Property

    Public Function GetHotel() As String
        If fvDocument.FindControl("HotelHeader") IsNot Nothing Then
            Return (CType(fvDocument.FindControl("HotelHeader"), Label).Text)
        Else : Return ""
        End If
    End Function

    Public Function GetTourOperator() As String
        If fvDocument.FindControl("TOHeader") IsNot Nothing Then
            Return (CType(fvDocument.FindControl("TOHeader"), Label).Text)
        Else : Return ""
        End If
    End Function

    Public Function IsInvoice() As Boolean
        Dim docCode As String = fvDocument.DataKey("DocCode")
        If String.IsNullOrEmpty(docCode) Then
            Return False
        Else
            Return docCode = "FT-RT"
        End If

    End Function

    Public Function ArCredit() As Boolean
        Dim docSign As Label = fvDocument.FindControl("lblDocTrSign")
        Dim docAccType As Label = fvDocument.FindControl("lblDocAccType")

        If docSign Is Nothing Or docAccType Is Nothing Then Return False

        Return docSign.Text = "Credit" And docAccType.Text = "AR"
    End Function

    Public Function CanApprove(ByVal pAmount As Decimal) As Boolean
        Dim ta As New dsUserReportTableAdapters.AccApproveLimitTableAdapter
        Dim t As dsUserReport.AccApproveLimitDataTable = ta.GetData()
        Dim r As dsUserReport.AccApproveLimitRow = t.Rows(0)

        Dim can As Boolean = False
        If My.User.IsInRole("admin") Then
            can = True
        ElseIf My.User.IsInRole("accounting_approve_C") Then
            can = True
        ElseIf My.User.IsInRole("accounting_approve_B") And pAmount < r.ApproveLimit_B Then
            can = True
        ElseIf My.User.IsInRole("accounting_approve_A") And pAmount < r.ApproveLimit_A Then
            can = True
        End If

        Return can
    End Function

    Public Function IsApproved() As Boolean
        Return CType(CType(fvDocument.FindControl("hfApproved"), HiddenField).Value, Boolean)
    End Function

    Public Function CanEdit() As Boolean
        Return hfCanEdit.Value
    End Function

    Public Function CanModify() As Boolean
        Return hfCanModify.Value
    End Function

    Public Function CanApply() As Boolean
        Return hfCanApply.Value And IsApproved()
    End Function

    Public Function ShwPayMode() As Boolean
        Return hfShwPayMode.Value
    End Function

    Public Function Balance() As Decimal
        Return hfBalance.Value
    End Function

    Public Function HBalance() As Decimal
        Return hfHBalance.Value
    End Function

    Public Function MyUserName() As String
        Return My.User.Name
    End Function
End Class

