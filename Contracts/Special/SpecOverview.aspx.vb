Partial Class Contracts_Special_SpecOverview
    Inherits System.Web.UI.Page
    Dim cID As Integer
    Dim gTable As Table
    Dim rFormat As dsCtrPrev.ContractRateFormatRow
    Dim bHasExtra As Boolean
    Dim lMaxOcc As Integer

#Region "Rate Rendering"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'dsContract.DataBind()
        'dsRates.DataBind()
        If IsPostBack Then gvRates.DataBind()
        Dim m As Contracts_Special_masterSpecial = CType(Master, Contracts_Special_masterSpecial)
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
                Dim f As New dsCtrPrevTableAdapters.ContractRateFormatTableAdapter
                Dim q As New dsCtrPrevTableAdapters.QueriesTableAdapter
                cRoom = GetCurrRoom(gvr)
                If cRoom.CompareTo(lRoom) <> 0 Then
                    rFormat = f.GetDataForSpec(cID, cRoom)(0)
                    bHasExtra = q.HasExtraSpec(cID, cRoom)
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
            Try
                If rowIndex > -1 Then rMP.Cells(0).RowSpan = rowIndex - gTable.Rows.GetRowIndex(rMP) + 1
            Catch ex As Exception
            End Try
        End If

        '' print single rate
        'sellink.CommandName = "Select"
        'sellink.Text = "Print"
        'tc.Controls.Add(sellink)
        'gvr.Cells.Add(tc)
        ''*****************

    End Sub

    Protected Sub FormatCurrRow(ByRef dRow As GridViewRow)
        Dim i As Integer
        Dim m As Integer

        Dim e As Boolean = (dRow.Cells(5).Text.Length > 170)
        dRow.Cells(5).Text = Left(dRow.Cells(5).Text, 170)
        If e Then dRow.Cells(5).Text &= "<b>&nbsp;&nbsp;<font color=""gray"">...</font></b>"

        m = rFormat.ChldCategories
        For i = m To 3
            dRow.Cells.RemoveAt(17 + m)
        Next

        If bHasExtra = False Then dRow.Cells.RemoveAt(16)

        m = rFormat.MaxROccupancy
        For i = m To 9
            dRow.Cells.RemoveAt(6 + m)
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
        sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 6
        'sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 5
        If bHasExtra Then sRow.Cells(0).ColumnSpan += 1

        Return sRow
    End Function

    Protected Function rowHeaderRoom(ByRef dRow As GridViewRow) As GridViewRow
        Dim ix As Integer = gTable.Rows.GetRowIndex(dRow)
        Dim sRow As New GridViewRow(ix, ix, DataControlRowType.DataRow, DataControlRowState.Normal)
        sRow.CssClass = "RowTitle"
        sRow.Cells.Add(dRow.Cells(0))
        sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 6
        'sRow.Cells(0).ColumnSpan = 3 + rFormat.MaxROccupancy + rFormat.ChldCategories + 5
        If bHasExtra Then sRow.Cells(0).ColumnSpan += 1

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
        sRow.Cells(1).HorizontalAlign = HorizontalAlign.Left
        sRow.Cells.Add(New TableCell()) 'Finish
        sRow.Cells(2).Text = "End"
        sRow.Cells(2).HorizontalAlign = HorizontalAlign.Left

        sRow.Cells.Add(New TableCell())
        sRow.Cells(3).Text = "Note"
        sRow.Cells(3).HorizontalAlign = HorizontalAlign.Left

        Dim i As Integer
        Dim m As Integer
        Dim p As String

        m = rFormat.MaxROccupancy
        If m > 10 Then m = 10
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
        ix = sRow.Cells.Add(New TableCell())
        sRow.Cells(ix).Text = "Allot."
        ix = sRow.Cells.Add(New TableCell())
        sRow.Cells(ix).Text = "Ct.Off"

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

#End Region

#Region "Reporting"

    Protected Sub btPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim reportname As String = "Rates_" & LayoutFilename()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        'lr.ReportPath = "Reports\Contracts\RptContractRateV02.rdlc"
        lr.ReportPath = "Reports\Contracts\RptContractRateV03.rdlc"
        lr.SetParameters(ReportParams())
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterContractRate1", dsCntRates))

        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte() = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function ReportParams() As ReportParameter()
        Dim q As New dsSpecMatrixTableAdapters.QueriesTableAdapter
        Dim s As Integer = Int32.Parse(Request.QueryString("SpecialID"))
        Dim c As Integer = ddlContract.SelectedValue
        Dim f As String = q.ReportSpoName(s, c)
        Dim fs As String() = f.Split("|".ToCharArray(), 2)

        Dim p As ReportParameter() = { _
            New ReportParameter("supp", False), _
            New ReportParameter("hotel", False), _
            New ReportParameter("filterstringDet", fs(1)), _
            New ReportParameter("pallhotel", False), _
            New ReportParameter("pallto", False), _
            New ReportParameter("filterstring", fs(0)), _
            New ReportParameter("user", Membership.GetUser.UserName)}

        Return p
    End Function

    Protected Sub btEDS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btEDS.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        'lr.ReportPath = "Contracts\Special\EDSLayout.rdlc"
        lr.ReportPath = "Contracts\Special\EDSLayoutNew.rdlc"

        dsRates.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_LayoutRates", dsLayoutRates))

        Dim bytes As Byte()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim reportname As String = "Karisma_" & LayoutFilename()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btGOGO_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGOGO.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Contracts\Special\GOGOLayout.rdlc"

        dsRates.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_LayoutRates", dsLayoutRates))

        Dim p As ReportParameter() = {New ReportParameter("pUser", Profile.UserSignature)}
        lr.SetParameters(p)

        Dim bytes As Byte()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim reportname As String = "GOGO_" & LayoutFilename()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGroup.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Contracts\Special\GroupLayout01.rdlc"
        'Additional discounts for:
        '   HotelID = 32 (AZS)
        '   HotelID = 35 (AZF)
        'Alter cancelation and payment for:
        '   TourOpID=863 (KHR - GRUPOS)

        dsRates.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_LayoutRates", dsLayoutRates))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSpecMatrix_ContractLayoutHeader", dsHeader))

        Dim bytes As Byte()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim reportname As String = "Group_" & LayoutFilename()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = mimeType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & reportname & "." & extension)

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function LayoutFilename() As String
        Dim q As New dsSpecMatrixTableAdapters.QueriesTableAdapter
        Dim s As Integer = Int32.Parse(Request.QueryString("SpecialID"))
        Dim c As Integer = ddlContract.SelectedValue

        Return q.LayoutSpoName(s, c)
    End Function

#End Region

End Class
