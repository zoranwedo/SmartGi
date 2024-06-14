
Partial Class Accounting_AccDocSearch
    Inherits System.Web.UI.Page

    Protected Sub gvDocuments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvDocuments.RowCommand
        Select Case e.CommandName
            Case "Details"
                Me.Response.Redirect("AccDocDetailNew.aspx?DocumentID=" & e.CommandArgument)
            Case "Apply"
                Me.Response.Redirect("AccDocApplication.aspx?DocumentID=" & e.CommandArgument)
            Case "Transfer"
                Me.Response.Redirect("AccTransfer.aspx?DocumentID=" & e.CommandArgument)
        End Select
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Accounting/AccRegisterDoc.aspx?DocumentID=0")
    End Sub

    Protected Sub btSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSearch.Click
        AccCookie()
        dsFilteredDocuments.Select()
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        exHotelGroup.SelectedValue = 0
        exHotel.SelectedValue = 0
        exTOGroup.SelectedValue = 0
        exTO.SelectedValue = 0
        'ddlHotelGroup.SelectedIndex = 0
        'ddlHotel.SelectedIndex = 0
        'ddlTOGroup.SelectedIndex = 0
        'ddlTO.SelectedIndex = 0
        ddlPayCond.SelectedIndex = 0
        ddlMarket.SelectedIndex = 0
        ddlTrSearch.Text = String.Empty
        txtDocNumFrom.Text = String.Empty
        txtDocNumTo.Text = String.Empty
        txtDocDateFrom.Text = String.Empty
        txtDocDateTo.Text = String.Empty
        cbZero.Checked = False
        cbCancel.Checked = False
        cbUnapproved.Checked = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        AccCookie()

        If Not (Page.IsPostBack) Then
            txtDocDateTo.Text = Today.ToShortDateString
        End If
    End Sub

    Protected Sub AccCookie()
        Dim cName As String = "AccDocSearch_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    'If (Request.Cookies(cName)("ddlHotelGroup") IsNot Nothing) Then exHotelGroup.SelectedValue = Integer.Parse(Request.Cookies(cName)("ddlHotelGroup"))
                    'If (Request.Cookies(cName)("ddlHotel") IsNot Nothing) Then exHotel.SelectedValue = Integer.Parse(Request.Cookies(cName)("ddlHotel"))
                    'If (Request.Cookies(cName)("ddlTOGroup") IsNot Nothing) Then exTOGroup.SelectedValue = Integer.Parse(Request.Cookies(cName)("ddlTOGroup"))
                    'If (Request.Cookies(cName)("ddlTO") IsNot Nothing) Then exTO.SelectedValue = Integer.Parse(Request.Cookies(cName)("ddlTO"))
                    If (Request.Cookies(cName)("ddlHotelGroup") IsNot Nothing) Then exHotelGroup.SelectedValue = Request.Cookies(cName)("ddlHotelGroup")
                    If (Request.Cookies(cName)("ddlHotel") IsNot Nothing) Then exHotel.SelectedValue = Request.Cookies(cName)("ddlHotel")
                    If (Request.Cookies(cName)("ddlTOGroup") IsNot Nothing) Then exTOGroup.SelectedValue = Request.Cookies(cName)("ddlTOGroup")
                    If (Request.Cookies(cName)("ddlTO") IsNot Nothing) Then exTO.SelectedValue = Request.Cookies(cName)("ddlTO")
                    'If (Request.Cookies(cName)("ddlTO") IsNot Nothing) Then exTO.SelectedValue = Integer.Parse(Request.Cookies(cName)("ddlTO"))
                    If (Request.Cookies(cName)("ddlPayCond") IsNot Nothing) Then ddlPayCond.SelectedValue = Request.Cookies(cName)("ddlPayCond")
                    If (Request.Cookies(cName)("ddlMarket") IsNot Nothing) Then ddlMarket.SelectedValue = Request.Cookies(cName)("ddlMarket")
                    If (Request.Cookies(cName)("ddlTrSearch") IsNot Nothing) Then ddlTrSearch.SelectedValue = Request.Cookies(cName)("ddlTrSearch")
                    If (Request.Cookies(cName)("txtDocNumFrom") IsNot Nothing) Then txtDocNumFrom.Text = Request.Cookies(cName)("txtDocNumFrom")
                    If (Request.Cookies(cName)("txtDocNumTo") IsNot Nothing) Then txtDocNumTo.Text = Request.Cookies(cName)("txtDocNumTo")
                    If (Request.Cookies(cName)("txtDocDateFrom") IsNot Nothing) Then txtDocDateFrom.Text = Request.Cookies(cName)("txtDocDateFrom")
                    If (Request.Cookies(cName)("txtDocDateTo") IsNot Nothing) Then txtDocDateTo.Text = Request.Cookies(cName)("txtDocDateTo")
                    If (Request.Cookies(cName)("cbZero") IsNot Nothing) Then cbZero.Checked = Boolean.Parse(Request.Cookies(cName)("cbZero"))
                    If (Request.Cookies(cName)("cbCancel") IsNot Nothing) Then cbCancel.Checked = Boolean.Parse(Request.Cookies(cName)("cbCancel"))
                    If (Request.Cookies(cName)("cbUnapproved") IsNot Nothing) Then cbUnapproved.Checked = Boolean.Parse(Request.Cookies(cName)("cbUnapproved"))

                    If (Request.Cookies(cName)("AccPage") IsNot Nothing) Then gvDocuments.PageIndex = Integer.Parse(Request.Cookies(cName)("AccPage"))
                    If (Request.Cookies(cName)("AccIndex") IsNot Nothing) Then gvDocuments.SelectedIndex = Integer.Parse(Request.Cookies(cName)("AccIndex"))
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("ddlHotelGroup") = exHotelGroup.SelectedValue
            Response.Cookies(cName)("ddlHotel") = exHotel.SelectedValue
            Response.Cookies(cName)("ddlTOGroup") = exTOGroup.SelectedValue
            Response.Cookies(cName)("ddlTO") = exTO.SelectedValue
            Response.Cookies(cName)("ddlPayCond") = ddlPayCond.SelectedValue
            Response.Cookies(cName)("ddlMarket") = ddlMarket.SelectedValue
            Response.Cookies(cName)("ddlTrSearch") = ddlTrSearch.SelectedValue
            Response.Cookies(cName)("txtDocNumFrom") = txtDocNumFrom.Text
            Response.Cookies(cName)("txtDocNumTo") = txtDocNumTo.Text
            Response.Cookies(cName)("txtDocDateFrom") = txtDocDateFrom.Text
            Response.Cookies(cName)("txtDocDateTo") = txtDocDateTo.Text
            Response.Cookies(cName)("cbZero") = cbZero.Checked
            Response.Cookies(cName)("cbCancel") = cbCancel.Checked
            Response.Cookies(cName)("cbUnapproved") = cbUnapproved.Checked

            Response.Cookies(cName)("AccPage") = gvDocuments.PageIndex
            Response.Cookies(cName)("AccIndex") = gvDocuments.SelectedIndex

            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub dsFilteredDocuments_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredDocuments.Selecting
        If e.InputParameters("HotelGroupId") = 0 Then e.InputParameters("HotelGroupId") = Nothing
        If e.InputParameters("HotelID") = 0 Then e.InputParameters("HotelID") = Nothing
        If e.InputParameters("TourOpGroupId") = 0 Then e.InputParameters("TourOpGroupId") = Nothing
        If e.InputParameters("TourOpId") = 0 Then e.InputParameters("TourOpId") = Nothing

        Dim n As Boolean = True
        For i As Integer = 1 To 10
            If e.InputParameters(i) IsNot Nothing Then
                n = False
                Exit For
            End If
        Next

        If n Then e.Cancel = True
    End Sub
End Class
