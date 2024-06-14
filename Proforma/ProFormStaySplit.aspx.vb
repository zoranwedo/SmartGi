Imports System.Data.SqlClient

Partial Class Proforma_ProFormStaySplit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (Me.IsPostBack Or Me.IsCallback) Then
            SplitGridDataBind(Nothing)
        End If
    End Sub

    Public Function RefValues(ByVal sDate As Date, ByVal maxNights As Integer) As String
        Dim s As String = ""
        For i = 1 To maxNights
            s = s & sDate.AddDays(i).ToShortDateString & ";"
        Next
        Return Left(s, Len(s) - 1)
    End Function

    Public Sub SplitGridDataBind(ByVal selIndex As Object)
        Dim q As New dsProformaTableAdapters.BookingSplitTableAdapter
        Dim t As dsProforma.BookingSplitDataTable = q.GetData(Request.QueryString("BookingID"))
        SplitGrid.DataSource = t
        If selIndex IsNot Nothing Then SplitGrid.EditIndex = selIndex
        SplitGrid.DataBind()
    End Sub

    Protected Sub SplitGrid_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles SplitGrid.RowCommand
        If (e.CommandName = "Split" And hfSplit.Value = False) Then
            Dim q As New dsProformaTableAdapters.BookingSplitTableAdapter
            Dim t As dsProforma.BookingSplitDataTable = q.GetData(Request.QueryString("BookingID"))

            Dim i As Integer = e.CommandArgument
            Dim splitRow As dsProforma.BookingSplitRow = t(i)
            Dim newRow As dsProforma.BookingSplitRow = t.NewBookingSplitRow
            Dim a1 As Date = splitRow.Arrival
            Dim d2 As Date = splitRow.Departure
            Dim n As Integer = splitRow.TravelNights
            Dim n1 As Integer = (n + 1) \ 2
            Dim n2 As Integer = n - n1
            Dim d1 As Date = a1.AddDays(n1)
            Dim a2 As Date = d1

            splitRow.Departure = d1
            splitRow.TravelNights = n1
            splitRow.MaxTravelNights = n - 1

            With newRow
                .InvDocID = splitRow.InvDocID
                .InvResID = 0
                .BookingID = splitRow.BookingID
                .RateID = splitRow.RateID
                .RateCodeID = splitRow.RateCodeID
                .Arrival = a2
                .Departure = d2
                .TravelNights = 1
                .MaxTravelNights = 1
                .TheFirst = True
                .TheLast = True
            End With

            t.Rows.InsertAt(newRow, i + 1)

            hfSplit.Value = True
            SplitGrid.DataSource = t
            SplitGrid.EditIndex = i
            SplitGrid.DataBind()
        End If
    End Sub

    Protected Sub SplitGrid_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles SplitGrid.RowCancelingEdit
        hfSplit.Value = False
        SplitGridDataBind(-1)
    End Sub

    Protected Sub SplitGrid_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles SplitGrid.RowEditing
        SplitGridDataBind(e.NewEditIndex)
    End Sub

    Protected Sub SplitGrid_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles SplitGrid.RowUpdating
        Dim q As New dsProformaTableAdapters.QueriesTableAdapter
        Try
            Dim row As GridViewRow = SplitGrid.Rows(e.RowIndex)
            Dim resID As Integer = CType(row.Cells(0).Controls(1), HiddenField).Value
            Dim depart As Date = CType(row.Cells(2).Controls(1), TextBox).Text
            If hfSplit.Value = True Then
                q.SplitInsert(resID, depart, My.User.Name)
            Else
                q.SplitEdit(resID, depart, My.User.Name)
            End If
            hfSplit.Value = False
            SplitGridDataBind(-1)
        Catch ex As Exception
            lblError.Text = ex.Message
        End Try
    End Sub

    Protected Sub SplitGrid_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles SplitGrid.RowDeleting
        Dim q As New dsProformaTableAdapters.QueriesTableAdapter
        Try
            Dim row As GridViewRow = SplitGrid.Rows(e.RowIndex)
            Dim resID As Integer = CType(row.Cells(0).Controls(1), HiddenField).Value
            q.SplitDelete(resID, My.User.Name)
            SplitGridDataBind(-1)
        Catch ex As Exception
            lblError.Text = ex.Message
        End Try
    End Sub
End Class
