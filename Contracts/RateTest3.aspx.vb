
Partial Class Contracts_RateTest3
    Inherits System.Web.UI.Page

    Dim cID As Integer
    Dim gTable As Table
    Dim rFormat As dsCtrPrev.ContractRateFormatRow
    Dim lMaxOcc As Integer

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsRates.DataBind()
    End Sub

    Protected Sub gvRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRates.DataBound
        If gvRates.Rows.Count > 0 Then
            cID = Int32.Parse(TextBox1.Text)
            gTable = CType(gvRates.Controls(0), Table)

            Dim rMP As GridViewRow                  'last MP row
            Dim lRoom As String = "-"               'last room
            Dim lRate As String = "-"               'last rate
            Dim lMP As String = "-"                 'last rate
            Dim cRoom As String = String.Empty      'current room
            Dim cRate As String = String.Empty      'current room
            Dim cMP As String = String.Empty        'current room
            Dim rowIndex As Integer = -1

            For Each gvr As GridViewRow In gvRates.Rows
                Dim f As New dsCtrPrevTableAdapters.ContractRateFormatTableAdapter
                cRoom = GetCurrRoom(gvr)
                If cRoom.CompareTo(lRoom) <> 0 Then rFormat = f.GetData(cID, cRoom)(0)
                FormatCurrRow(gvr)

                rowIndex = gTable.Rows.GetRowIndex(gvr)
                If cRoom.CompareTo(lRoom) <> 0 Then

                    'RoomTypeHeader
                    gTable.Controls.AddAt(rowIndex, rowSeparator(gvr))
                    gTable.Controls.AddAt(rowIndex + 1, rowHeaderRoom(gvr))
                    gTable.Controls.AddAt(rowIndex + 2, rowHeaderRate(gvr))
                    If rMP IsNot Nothing Then rMP.Cells(0).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                    rMP = gTable.Rows(rowIndex + 3)
                    rMP.Cells(0).CssClass = "RowMP"

                    lRoom = cRoom
                    lRate = GetCurrRate(gvr)
                    lMP = GetCurrMP(gvr)
                Else
                    gvr.Cells.RemoveAt(0)
                    cRate = GetCurrRate(gvr)
                    If cRate.CompareTo(lRate) <> 0 Then
                        gTable.Controls.AddAt(rowIndex, rowHeaderRate(gvr))
                        rMP.Cells(0).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                        rMP = gTable.Rows(rowIndex + 1)
                        rMP.Cells(0).CssClass = "RowMP"
                        lRate = cRate
                        lMP = GetCurrMP(gvr)
                    Else
                        gvr.Cells.RemoveAt(0)
                        cMP = GetCurrMP(gvr)
                        If cMP.CompareTo(lMP) <> 0 Then
                            rMP.Cells(0).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                            rMP = gvr
                            rMP.Cells(0).CssClass = "RowMP"
                            lMP = cMP
                        Else
                            gvr.Cells.RemoveAt(0)
                        End If
                    End If
                End If
                gvr.Cells.RemoveAt(gvr.Cells.Count - 1)
            Next
            If rowIndex > -1 Then rMP.Cells(0).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP) + 1
        End If

    End Sub

    Protected Sub FormatCurrRow(ByRef dRow As GridViewRow)
        Dim i As Integer
        Dim m As Integer

        m = rFormat.ChldCategories
        For i = m To 3
            dRow.Cells.RemoveAt(15 + m)
        Next

        m = rFormat.MaxROccupancy
        For i = m To 9
            dRow.Cells.RemoveAt(5 + m)
        Next
    End Sub

    Protected Function GetCurrRoom(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblRoomID"), Label).Text
    End Function

    Protected Function GetCurrRate(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblRateCode"), Label).Text
    End Function

    Protected Function GetCurrMP(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblMealPlan"), Label).Text
    End Function

    Protected Function GetExtra(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("hfExtra"), HiddenField).Value
    End Function

    Protected Function GetMaxPax(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("hfRoccup"), HiddenField).Value
    End Function


    Protected Function rowSeparator(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.DataRow, DataControlRowState.Normal)
        sRow.CssClass = "GridRowClear"
        sRow.Cells.Add(New TableCell())
        sRow.Cells(0).Text = "&nbsp;"
        sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 4

        Return sRow
    End Function

    Protected Function rowHeaderRoom(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.DataRow, DataControlRowState.Normal)
        sRow.CssClass = "RowTitle"
        sRow.Cells.Add(dRow.Cells(0))
        sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 4

        Return sRow
    End Function

    Protected Function rowHeaderRate(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.Header, DataControlRowState.Normal)
        sRow.CssClass = "RowRoom"
        sRow.Cells.Add(dRow.Cells(0))
        sRow.Cells(0).HorizontalAlign = HorizontalAlign.Center
        sRow.Cells.Add(New TableCell()) 'Start
        sRow.Cells(1).Text = "Start"
        sRow.Cells.Add(New TableCell()) 'Finish
        sRow.Cells(2).Text = "End"

        Dim i As Integer
        Dim m As Integer
        Dim p As String

        m = rFormat.MaxROccupancy
        For i = 1 To m
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = "Pax" & i.ToString



        Next

        If rFormat.DiscIsPercent Then p = "%" Else p = "$"
        m = rFormat.ChldCategories
        If m > 0 Then
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = rFormat.Chld1ShLabel
            sRow.Cells(ix).ToolTip = rFormat.Chld1AgShLabel
            If Not rFormat.IsDiscChld1Null Then sRow.Cells(ix).ToolTip &= " (-" & rFormat.DiscChld1 & p & ")"
        End If
        If m > 1 Then
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = rFormat.Chld2ShLabel
            sRow.Cells(ix).ToolTip = rFormat.Chld2AgShLabel
            If Not rFormat.IsDiscChld2Null Then sRow.Cells(ix).ToolTip &= " (-" & rFormat.DiscChld2 & p & ")"
        End If
        If m > 2 Then
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = rFormat.Chld3ShLabel
            sRow.Cells(ix).ToolTip = rFormat.Chld3AgShLabel
            If Not rFormat.IsDiscChld3Null Then sRow.Cells(ix).ToolTip &= " (-" & rFormat.DiscChld3 & p & ")"
        End If
        If m > 3 Then
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = rFormat.Chld4ShLabel
            sRow.Cells(ix).ToolTip = rFormat.Chld4AgShLabel
            If Not rFormat.IsDiscChld4Null Then sRow.Cells(ix).ToolTip &= " (-" & rFormat.DiscChld4 & p & ")"
        End If

        sRow.Cells.Add(New TableCell())
        sRow.Cells.Add(New TableCell())
        ix = sRow.Cells.Add(New TableCell())
        sRow.Cells(ix).Text = "Ct.Off"
        ix = sRow.Cells.Add(New TableCell())
        sRow.Cells(ix).Text = "Allot."

        Return sRow
    End Function

End Class
