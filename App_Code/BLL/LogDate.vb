Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class LogDateInic
    Public Shared Function GetDateInit() As Date
        Dim userName As String = Membership.GetUser.UserName
        Dim uTA As New UserTableAdapters.UserTableAdapter
        Dim uRow As User.UserRow = uTA.GetByUserName(userName).Rows(0)
        Dim dateinit As Date

        If (Not uRow.IsPeriodMonthNull) And (Not uRow.IsPeriodYearNull) Then
            Dim logmonth As Integer = uRow.PeriodMonth
            Dim logyear As Integer = uRow.PeriodYear
            Dim currmonth As Integer = Today.Month
            Dim curryear As Integer = Today.Year

            If logyear = curryear Then
                If logmonth < currmonth Then
                    Dim tempday As Integer
                    '            DateAdd(DateInterval.Day, _
                    '(Day(DateAdd(DateInterval.Month, 1, dtDate))) * -1, _
                    ' DateAdd(DateInterval.Month, 1, dtDate))

                    tempday = Day(DateAdd("d", -1, DateSerial(logyear, logmonth + 1, 1)))
                    dateinit = DateSerial(logyear, logmonth, tempday)

                Else
                    dateinit = Today()
                End If
            Else
                If logyear < curryear Then
                    Dim tempday As Integer
                    tempday = Day(DateAdd("d", -1, DateSerial(logyear, logmonth + 1, 1)))
                    dateinit = DateSerial(logyear, logmonth, tempday)
                Else
                    dateinit = Today()
                End If
            End If
        Else
            dateinit = Today()
        End If

        Return dateinit
    End Function
End Class
