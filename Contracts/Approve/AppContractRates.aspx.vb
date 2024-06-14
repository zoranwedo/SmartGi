Partial Class Contracts_Approve_AppContractRates
    Inherits System.Web.UI.Page
    Dim cID As Integer
    Dim gTable As Table
    Dim lMaxOcc As Integer
    Dim bHasExtra As Boolean
    Dim rFormat As dsApproveContract.ContractRateFormatRow

    Protected Sub Page_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        gvRates.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RePopulateValues()
    End Sub

    Protected Sub gvRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRates.DataBound
        If gvRates.Rows.Count > 0 Then
            cID = Request.QueryString(0)
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
                Dim f As New dsApproveContractTableAdapters.ContractRateFormatTableAdapter
                Dim q As New dsApproveContractTableAdapters.QueriesTableAdapter
                cRoom = GetCurrRoom(gvr)
                If cRoom.CompareTo(lRoom) <> 0 Then
                    rFormat = f.GetData(cID, cRoom)(0)
                    bHasExtra = q.HasExtra(cID, cRoom)
                End If
                FormatCurrRow(gvr)

                rowIndex = gTable.Rows.GetRowIndex(gvr)
                If cRoom.CompareTo(lRoom) <> 0 Then

                    'RoomTypeHeader
                    If rowIndex = 1 Then
                        rowIndex = 0
                    Else
                        gTable.Controls.AddAt(rowIndex, rowSeparator(gvr))
                    End If
                    gTable.Controls.AddAt(rowIndex + 1, rowHeaderRoom(gvr))
                    gTable.Controls.AddAt(rowIndex + 2, rowHeaderRate(gvr))
                    If rMP IsNot Nothing Then rMP.Cells(1).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                    rMP = gTable.Rows(rowIndex + 3)
                    rMP.Cells(1).CssClass = "RowMP"

                    lRoom = cRoom
                    lRate = GetCurrRate(gvr)
                    lMP = GetCurrMP(gvr)
                Else
                    gvr.Cells.RemoveAt(1)
                    cRate = GetCurrRate(gvr)
                    CType(gvr.Cells(0).Controls(1), CheckBox).EnableViewState = True
                    If cRate.CompareTo(lRate) <> 0 Then
                        gTable.Controls.AddAt(rowIndex, rowHeaderRate(gvr))
                        rMP.Cells(1).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                        rMP = gTable.Rows(rowIndex + 1)
                        rMP.Cells(1).CssClass = "RowMP"
                        lRate = cRate
                        lMP = GetCurrMP(gvr)
                    Else
                        gvr.Cells.RemoveAt(1)
                        cMP = GetCurrMP(gvr)
                        If cMP.CompareTo(lMP) <> 0 Then
                            rMP.Cells(1).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP)
                            rMP = gvr
                            rMP.Cells(1).CssClass = "RowMP"
                            lMP = cMP
                        Else
                            gvr.Cells.RemoveAt(1)
                        End If
                    End If
                End If
                gvr.Cells.RemoveAt(gvr.Cells.Count - 1)
            Next
            Try
                If rowIndex > -1 Then rMP.Cells(1).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP) + 1
            Catch ex As Exception
            End Try
        End If

    End Sub

    Protected Sub FormatCurrRow(ByRef dRow As GridViewRow)
        Dim i As Integer
        Dim m As Integer

        m = rFormat.ChldCategories
        For i = m To 3
            dRow.Cells.RemoveAt(18 + m)
        Next

        If bHasExtra = False Then dRow.Cells.RemoveAt(16)

        m = rFormat.MaxROccupancy
        For i = m To 9
            dRow.Cells.RemoveAt(7 + m)
        Next
    End Sub

    Protected Function GetCurrRoom(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblRoomID"), Label).Text
    End Function

    Protected Function GetCurrRoomFull(ByRef dRow As GridViewRow) As String
        Dim r As String = CType(dRow.FindControl("lblRoomID"), Label).Text
        r = r & " [" & CType(dRow.FindControl("lblRoom"), Label).Text & "]"
        Return r
    End Function

    Protected Function GetCurrRate(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblRateCode"), Label).Text
    End Function

    Protected Function GetCurrMP(ByRef dRow As GridViewRow) As String
        Return CType(dRow.FindControl("lblMealPlan"), Label).Text
    End Function

    Protected Function GetExtra(ByRef dRow As GridViewRow) As Integer
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
        sRow.Cells(0).ColumnSpan = 4 + rFormat.MaxROccupancy + rFormat.ChldCategories + 5
        If bHasExtra Then sRow.Cells(0).ColumnSpan += 1

        Return sRow
    End Function

    Protected Function rowHeaderRoom(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.DataRow, DataControlRowState.Normal)
        Dim cbAll As New CheckBox

        sRow.CssClass = "RowTitle"
        sRow.Cells.Add(New TableCell()) 'CheckBox RateCodeID
        sRow.Cells(0).HorizontalAlign = HorizontalAlign.Left
        sRow.Cells(0).Controls.Add(cbAll)
        sRow.Cells(0).Controls.Add(dRow.FindControl("lblRoom"))
        cbAll.Text = GetCurrRoom(dRow)
        cbAll.TextAlign = TextAlign.Right
        cbAll.AutoPostBack = True

        If cbAll.Text.CompareTo(ViewState("Room")) = 0 Then
            cbAll.Checked = ViewState("RoomSel")
        End If
        AddHandler cbAll.CheckedChanged, AddressOf cbAll_CheckedChanged
        dRow.Cells.RemoveAt(1)

        sRow.Cells(0).ColumnSpan = 5 + rFormat.MaxROccupancy + rFormat.ChldCategories + 2
        If bHasExtra Then sRow.Cells(0).ColumnSpan += 1

        Return sRow
    End Function

    Protected Function rowHeaderRate(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.Header, DataControlRowState.Normal)

        sRow.CssClass = "RowRoom"
        sRow.Cells.Add(dRow.Cells(1)) 'RateCodeID
        sRow.Cells(0).HorizontalAlign = HorizontalAlign.Left
        sRow.Cells(0).Font.Italic = False
        sRow.Cells.Add(New TableCell()) 'Start
        sRow.Cells(1).Text = "Meal Plan"
        sRow.Cells(1).HorizontalAlign = HorizontalAlign.Center

        sRow.Cells.Add(New TableCell()) 'Start
        sRow.Cells(2).Text = "Start"
        sRow.Cells(2).HorizontalAlign = HorizontalAlign.Left
        sRow.Cells.Add(New TableCell()) 'Finish
        sRow.Cells(3).Text = "End"
        sRow.Cells(3).HorizontalAlign = HorizontalAlign.Left

        sRow.Cells.Add(New TableCell())
        sRow.Cells(4).Text = "Note"
        sRow.Cells(4).HorizontalAlign = HorizontalAlign.Left

        Dim i As Integer
        Dim m As Integer
        Dim p As String

        m = rFormat.MaxROccupancy
        For i = 1 To m
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = GetPaxLabel(i)
        Next

        If bHasExtra Then
            ix = sRow.Cells.Add(New TableCell())
            sRow.Cells(ix).Text = "Extra Pax"
        End If

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

        Return sRow
    End Function

    Protected Function GetPaxLabel(ByVal index As Integer) As String
        Dim pax As String = ""
        Select Case index
            Case 1
                pax = "Single"
            Case 2
                pax = "Double"
            Case 3
                pax = "Triple"
            Case 4
                pax = "Quadr."
            Case 5
                pax = "Quint."
            Case 6
                pax = "Sext."
            Case 7
                pax = "Sept."
            Case 8
                pax = "Octup."
            Case 9
                pax = "Nonup."
            Case 10
                pax = "Decup."
        End Select
        Return pax
    End Function

    Protected Sub cbAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gvr As GridViewRow
        For Each gvr In gvRates.Rows
            set_check(gvr, CType(sender, CheckBox).Checked, CType(sender, CheckBox).Text)
        Next
        RememberOldValues()
        ViewState("Room") = CType(sender, CheckBox).Text
        ViewState("RoomSel") = CType(sender, CheckBox).Checked
        
    End Sub
    Protected Sub RememberOldValues()
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim categoryIDList As ArrayList = New ArrayList
        Dim index As Integer = -1

        For Each grv In gvRates.Rows
            index = gvRates.DataKeys(grv.RowIndex).Value
            Dim res As Boolean
            tc = grv.Cells(0)
            res = CType(tc.Controls(1), CheckBox).Checked
            ' Check in the Session

            If ViewState("CHECKED_ITEMS") IsNot Nothing Then
                categoryIDList = CType(ViewState("CHECKED_ITEMS"), ArrayList)
            End If

            If res Then
                If Not (categoryIDList.Contains(index)) Then
                    categoryIDList.Add(index)
                End If
            Else
                categoryIDList.Remove(index)
            End If

            If (categoryIDList IsNot Nothing And categoryIDList.Count > 0) Then
                ViewState("CHECKED_ITEMS") = categoryIDList
            End If


        Next

    End Sub
    Protected Sub RePopulateValues()
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim categoryIDList As ArrayList
        Dim grvroom As String

        Dim index As Integer
        If CType(ViewState("CHECKED_ITEMS"), ArrayList) IsNot Nothing Then
            categoryIDList = CType(ViewState("CHECKED_ITEMS"), ArrayList)
            If (categoryIDList IsNot Nothing And categoryIDList.Count > 0) Then
                For Each grv In gvRates.Rows
                    index = gvRates.DataKeys(grv.RowIndex).Value
                    tc = grv.Cells(0)

                    If ViewState("Rooms") IsNot Nothing Then
                        grvroom = CType(tc.Controls(2), HiddenField).Value
                        If (ViewState("Rooms").Contains(grvroom)) Then
                            '
                        Else
                            CType(tc.Controls(1), CheckBox).Checked = True
                        End If
                    Else
                        If (categoryIDList.Contains(index)) Then
                            tc = grv.Cells(0)
                            CType(tc.Controls(1), CheckBox).Checked = True
                        End If
                    End If

                Next
            End If
        End If

    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

    End Sub

    Protected Sub Page_SaveStateComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SaveStateComplete

    End Sub
    Protected Sub set_check(ByRef dRow As GridViewRow, ByVal chk As Boolean, ByVal room As String)
        Dim currroom As String = IIf(dRow.FindControl("hfRoom") IsNot Nothing, CType(dRow.FindControl("hfRoom"), HiddenField).Value, "")
        If currroom.CompareTo(room) = 0 Then
            CType(dRow.Cells(0).Controls(1), CheckBox).Checked = chk
        End If
        CType(dRow.Cells(0).Controls(1), CheckBox).EnableViewState = False
    End Sub

    Protected Sub lbUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim proc As New dsApproveContractTableAdapters.QueriesTableAdapter
        Dim usr As String = Membership.GetUser.UserName
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        Dim index As Integer

        For Each grv In gvRates.Rows
            index = gvRates.DataKeys(grv.RowIndex).Value
            Dim res As Boolean
            tc = grv.Cells(0)
            If tc IsNot Nothing Then
                If CType(tc.Controls(1), CheckBox).Enabled Then
                    res = CType(tc.Controls(1), CheckBox).Checked
                    Try
                        proc.pgsRate_Approve(index, res, usr)
                    Catch ex As Exception
                        popShow("Error Uppdating Rate", ex)
                    End Try
                End If               
            End If
        Next

    End Sub
    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            If ex.InnerException IsNot Nothing Then
                popMessage.Text = ex.InnerException.Message
            Else
                popMessage.Text = ex.Message
            End If
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub
End Class
